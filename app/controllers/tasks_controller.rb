class TasksController < ApplicationController
    before_action :set_list
    before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_done]
    before_action :authenticate_user!

    def index 
        @tasks = @list.tasks
        if params[:filter_by_tag] 
            @tasks = @tasks.select{|task| task.tags.any? {|tag| tag.name == params[:filter_by_tag]}} 
        end
        @tasks = @tasks.select{|task| task.done == false}
    end

    def new
        @task = Task.new
    end 

    def create
        @task = Task.new(task_params)
        @task.list_id = @list.id

        if @task.save
            redirect_to list_tasks_path(@list.id), notice: 'Task was successfully created.'
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
        redirect_to list_tasks_url, notice: 'Task was successfully destroyed.'
    end 

    def mark_as_done
        if @task.done
            redirect_to list_tasks_path, notice: 'This task is already done.'
        else
            @task.update!(done: true, done_at: Time.now)
            redirect_to list_tasks_path, notice: 'Congratulations, this task is done.'
        end
    end

    def archived
        @tasks = @list.tasks
        @tasks = @tasks.select{|task| task.done == true}
    end

    private 

    def set_list
        @list = current_user.lists.find(params[:list_id])
    end

    def set_task
        @task = @list.tasks.find(params[:id])
    end
   
    def task_params
        params.require(:task).permit(:name, :description, :duration, :all_tags)
    end
end
