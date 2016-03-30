class CommentsController < ApplicationController 
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      redirect_to post_path(@post), notice: "Comment was successfully added"
    else
      flash.now[:error] = "Error saving comment"
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end