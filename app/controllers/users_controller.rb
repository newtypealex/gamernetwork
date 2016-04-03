class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this User"
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def dashboard
    @user = User.find(current_user.id)
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:title, :genre, :description,:photo, :game_ids => [],:developer_ids => [],:platform_ids=>[])
  end

end
