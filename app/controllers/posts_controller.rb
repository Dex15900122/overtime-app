class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.post_by current_user
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'Your post has been created successfully'
    else
      render :new
    end
  end


  def show

  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'your post has been update'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end




  private

    def post_params
      params.require(:post).permit(:date, :rationable, :status, :overtime_request)
    end


    def set_post
      @post = Post.find(params[:id])
    end
    
  
end
