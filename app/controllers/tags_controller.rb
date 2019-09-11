class TagsController < ApplicationController
    before_action :set_tag, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index 
        @tags = current_user.tags
    end

    def show
    end
    
    def edit 
    end 

    def update 
        if @tag.update(tag_params) 
            redirect_to @tag, notice: 'Tag was successfully updated.'
        else 
            render :edit
        end
    end 

    def destroy 
        @tag.destroy
        redirect_to tags_url, notice: 'Tag was successfully destroyed.'
    end 

    private 

    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name, :all_tags)
    end
end
