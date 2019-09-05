class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index 
        @tasks = current_user.tasks
    end

    def show 
    end

    def new
        @task = Task.new
    end 

    def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id

        respond_to do |format|
            if @task.save 
                format.html { redirect_to @task, notice: 'Task was successfully created.'}
            else 
                format.html { render :new }
            end
        end
    end 
    
    def edit 
        #@tasks = Task.find(params[:id])
    end 

    def update 
        respond_to do |format|
            if @task.update(task_params) 
                format.html { redirect_to @task, notice: 'Task was successfully updated.'}
            else 
                format.html { render :edit }
            end
        end
    end 

    def destroy 
        @task.destroy
        respond_to do |format|
            format.html {redirect_to tasks_url, notice: 'Task was successfully destroyed.'}
        end
    end 

    private 

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :done, :all_tags)
    end
end
