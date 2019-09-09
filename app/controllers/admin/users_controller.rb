class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index 
        @users = User.all
    end 

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path, notice: "User deleted"
    end 
end 