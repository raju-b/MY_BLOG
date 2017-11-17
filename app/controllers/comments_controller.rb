class CommentsController < ApplicationController
	def create
      @post =Post.find(params[:post_id])
    if  @comment = @post.comments.create(comment_params)
      flash[:alert] = "comment created to this post...."
      redirect_to post_path(@post)
    else 
      render 'index'
    end
    
  end
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])


  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:alert] = "comment updated successfully... "
      redirect_to post_path(@post)   
    else
      render 'edit'
    end
  end

   def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:alert] = "comment deleted successfully... "
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:post_id, :comments).merge(user_id: current_user.id)
    end
end
