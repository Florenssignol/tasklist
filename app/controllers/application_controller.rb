class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def verify_list_access
        if current_user.id == @list.user_id
            return true 
        elsif @list.list_accesses.exists?(user_id: current_user.id)
            return true
        else
            return false
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :remember_me])
    end
end
