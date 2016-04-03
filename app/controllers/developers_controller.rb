class DevelopersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @developers = Developer.all
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      flash[:notice] = "Developer was successfully created"
      redirect_to developer_path(@developer)
    else
      flash.now[:error] = "An error occurred while saving this developer"
      #render :new
    end
  end

def show
  @developer = Developer.find(params[:id])
  @posts = Post.all
end

def new
@developer = Developer.new
end


def edit
  @developer = Developer.find(params[:id])
end

def update
  @developer = Developer.find(params[:id])
     if @developer.update(developer_params)
       redirect_to developer_path(@developer), notice: "Developer was successfully updated!"
     else
       flash.now[:error] = "An error occurred when updating this developer"
       render :edit
     end
end

def destroy
  @developer = Developer.find(params[:id])
  @developer.destroy
  redirect_to developer_path, notice: "Developer was successfully deleted"
end


  private

def developer_params
  params.require(:developer).permit(:name, :photo)
end
end
