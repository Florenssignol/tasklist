class ListAccessesController < ApplicationController
    before_action :authenticate_user!

    def new
        @list = current_user.lists.find(params[:list_id])
        @list_access = ListAccess.new
    end

    def create
        @list = current_user.lists.find(params[:list_id])
        @list_access = ListAccess.new(list_access_params)
        @list_access.list = @list
    
        if @list_access.save
            redirect_to lists_path, notice: 'List was successfully shared.' 
        else
            render :new 
        end
    end

    private 

    def list_access_params
        params.require(:list_access).permit(:user_id, :list_id)
    end
end