class PostsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_post, only: [ :show, :edit,:update, :destroy]
  

  
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
    @post = current_user.posts.build(post_params)
    

    if      
      @post.save
      flash[:notice] = "$$ Post created successfully $$"
      redirect_to @post
    else
      flash[:error] = "$$ Something went wrong! $$"
      render action: :new
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

  
private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit( :title, :image, :description)
  end
  
end