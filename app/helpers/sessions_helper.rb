module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        
        # if @current_user.nil?
        #     redirect_to new_session_path
        # end
    end
    
    def logged_in?
        current_user.present?
    end
end
