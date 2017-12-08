class PostsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_post, only: [ :show, :edit,:update, :destroy, :like, :dislike]
  
  def index
  	@posts = Post.order(created_at: :desc)
  end

  def new
  	@post = Post.new
  end

  def show
  	
  end

  def edit
  	
  end
 
  def create
    
    images_attributes = post_params[:images_attributes]
    p_params = {title: post_params[:title], description: post_params[:description]}
    @post = current_user.posts.build(p_params)
  if images_attributes.present?
    images_attributes.each do |image|
      @post.images.build({image: image})
    end
  else
    
    if @post.save
      flash[:notice] = "$$ Post created successfully $$"
      redirect_to @post
    else
      flash[:error] = "$$ Something went wrong! $$"
      render action: :new
    end
  end  
  end

  def update
  	if @post.update(post_params)
      flash[:notice] = "$$ Post updated successfully $$"
      redirect_to @post
    else
      flash[:error] = "$$ Something went wrong! $$"
      render action: :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  def like
    votes = @post.votes
    vote = votes.find_by(post_id: params[:id],user_id: current_user.id)
      if votes.present? && vote.present?
        
         if vote.like == 1
            vote.update(like: 0)
          else
            vote.update(like: 1, dislike: 0)
          end
      else
        @post.votes.create(post_id: params[:id],user_id: current_user.id, like: 1)  
      end
          
     redirect_to post_path(params[:id]) 
  
  end

  def dislike
    
   votes = @post.votes
   vote = votes.find_by(post_id: params[:id],user_id: current_user.id)
      if votes.present? && vote.present?
        
          if vote.dislike == nil || vote.like == 1
             vote.update(dislike: 1, like: 0)
          elsif vote.dislike == 1
             vote.update(dislike: 0)
           else
            vote.update(dislike: 1)
          end   
      else
        @post.votes.create(post_id: params[:id],user_id: current_user.id, dislike: 1)  
      end
        redirect_to post_path(params[:id] )
  end

    
private
  def set_post
    @post = Post.find(params[:id])
  end
  def vote_params 
    params.require(:vote).permit(:like,:dislike,:post_id,:user_id)
  end

  def post_params
  	params.require(:post).permit( :title, :image, :description,:images_attributes => [])
  end
  
end