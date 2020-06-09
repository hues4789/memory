class ApplicationController < ActionController::Base
    include SessionsHelper
 #TO_DO　private書く
        def logged_in_user
            unless logged_in?
                redirect_to login_url
            end
        end
end
