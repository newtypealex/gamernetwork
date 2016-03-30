class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "An error occurred while saving this post"
      render :new
    end
  end


  def show
    @post = Post.find(params[:id])

    # send empty @comment instance for comment form
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end


  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "Post was successfully updated!"
      else
        flash.now[:error] = "An error occurred when updating this Post"
        render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
