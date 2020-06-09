module SessionsHelper
    #渡されたユーザーでログイン　ブラウザのCookieにuserIdを保存
    def log_in(user)
        session[:user_id] = user.id
    end

    #現在ログイン中のユーザーを返す
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    #受け取ったユーザーがログイン中かどうか
    def current_user?(user)
        user == current_user
    end

    #ユーザーがログインしていればtrue
    def logged_in?
        !current_user.nil?
    end

    # 現在のユーザーをログアウトする
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end

