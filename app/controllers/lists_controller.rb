class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    if @list.save
      redirect_to list_tasks_path(@list), notice: 'List was successfully created.'
      List.reindex 
    else
      render :new 
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_tasks_path(@list), notice: 'List was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @list.destroy    
    redirect_to lists_path, notice: 'List was successfully destroyed.' 
  end

  private

  def set_list
    @list = List.find(params[:id])

    if verify_list_access == false
      redirect_to root_path, notice: "you don't have access to this list"
    end
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
