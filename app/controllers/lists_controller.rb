class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @task.user_id = current_user.id

      if @list.save
        redirect_to @list, notice: 'List was successfully created.' 
      else
        render :new 
      end
    end
  end

  def update
      if @list.update(list_params)
        redirect_to @list, notice: 'List was successfully updated.' 
      else
        render :edit
      end
    end
  end

  def destroy
      redirect_to lists_url, notice: 'List was successfully destroyed.' 
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.fetch(:list, {:name, :description, :percentage_done})
    end
end
