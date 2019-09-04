class TasksController < ApplicationController
    before_action :set_to_do, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index 
        @tasks = current_user.tasks
    end

    def show 
    end

    def new
        @tasks = Task.new
    end 

    def create
        @tasks = Task.new(task_params)
        @tasks.user_id = current_user.id
    end 
    
    def edit 
        #@tasks = Task.find(params[:id])
    end 

    def update 
        task = Task.find(params[:id])
        @task.update!(task_params)
        redirect_to task
    end 

    def destroy 
        @task.destroy
    end 

    private 

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name)
    end
end
