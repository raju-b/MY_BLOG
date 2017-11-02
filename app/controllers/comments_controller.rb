class CommentsController < ApplicationController
	def create
    @post =Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    
    redirect_to post_path(@post)
    flash[:notice] = " $$ comment created successfully to this post $$"
  end
   def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "$$ comment deleted successfully $$"
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:post_id, :comment).merge(user_id: current_user.id)
    end
end
