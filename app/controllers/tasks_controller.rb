class TasksController < ApplicationController
    before_action :logged_in_user, only:[:edit, :update, :destroy]
    
    def index
        @learncontext = TLearnContext.all
    end

    def create
        @learncontext = TLearnContext.new
    end

    def create_post
        @learncontext = TLearnContext.new(learncontext_params)
        if @learncontext.save
        flash[:success] = "登録完了"
        redirect_to create_task_path
        else
        flash.now[:fail] = "登録に失敗しました"
        render 'create_user'
        end
    end

    private
    def learncontext_params
        params.require(:t_learn_context).permit(:LearnContext).merge(user_id: session[:user_id])
    end
end
