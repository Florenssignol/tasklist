class Admin::ListsController < ApplicationController
    before_action :authenticate_admin!

    def show 
        @list = List.find(params[:id])
        @tasks = @list.tasks
    end

end