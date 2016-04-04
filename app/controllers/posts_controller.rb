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
    #returns all post minus current post, ordered by create date. 
    #requires all_except to be defined in the model. 
    @posts = Post.all_except(params[:id]).order(created_at: :desc)
    
    # send empty @comment instance for comment form
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @posts = @user.posts.all_except(params[:id]).order(created_at: :desc)

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
    params.require(:post).permit(:title, :body, :user_id, :teaser, :photo, :tag_ids=>[])
  end

end
