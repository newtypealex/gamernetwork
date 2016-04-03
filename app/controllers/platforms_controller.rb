class PlatformsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @platforms = Platform.all
  end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      flash[:notice] = "Platform was successfully created"
      redirect_to platform_path(@platform)
    else
      flash.now[:error] = "An error occurred while saving this platform"
      #render :new
    end
  end

def show
  @platform = Platform.find(params[:id])
  @posts = Post.all
end

def new
@platform = Platform.new
end


def edit
  @platform = Platform.find(params[:id])
end

def update
  @platform = Platform.find(params[:id])
     if @platform.update(platform_params)
       redirect_to platform_path(@platform), notice: "Platform was successfully updated!"
     else
       flash.now[:error] = "An error occurred when updating this platform"
       render :edit
     end
end

def destroy
  @platform = Platform.find(params[:id])
  @platform.destroy
  redirect_to platform_path, notice: "Platform was successfully deleted"
end


  private

#   def find_character
#     @character = Character.find(params[:id])
#   end

def platform_params
  params.require(:platform).permit(:name, :photo)
end

end
