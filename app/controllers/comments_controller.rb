class CommentsController < ApplicationController
  def create    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user_id = 2 # need fix

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end