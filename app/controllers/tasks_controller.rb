class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index 
        @tasks = current_user.tasks
        if params[:filter_by_tag] 
            @tasks = @tasks.select{|task| task.tags.any? {|tag| tag.name == params[:filter_by_tag]}}
        end
    end

    def show 
    end

    def new
        @task = Task.new
    end 

    def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id
        
        if @task.save 
            redirect_to @task, notice: 'Task was successfully created.'
        else 
            render :new 
        end
    end 
    
    def edit 
    end 

    def update 
        if @task.update(task_params) 
            redirect_to @task, notice: 'Task was successfully updated.'
        else 
            render :edit 
        end
    end 

    def destroy 
        @task.destroy    
        redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end 

    private 

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :done, :description, :duration, :all_tags)
    end
end
