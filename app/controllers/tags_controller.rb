class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Tag was successfully created"
      redirect_to tags_path
    else
      flash.now[:error] = "An error occurred while saving this tag"
      #render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path(@tag), notice: "Tag was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this tag"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "Tag was successfully deleted"
  end


  private

#   def find_character
#     @character = Character.find(params[:id])
#   end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
