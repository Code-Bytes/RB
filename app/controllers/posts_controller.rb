class PostsController < ApplicationController
  before_action :set_current_user
  before_action :authenticate!, only: [:create, :update, :delete]

  def create
    @post = Post.new(title: params[:title], content: params[:content], user:current_user)
    if @post.save
      render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.update(post_params)
      render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy(post_params)
      render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.order(written_at: :desc)
    render json: @posts, status: :ok
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :tag_names)
  end

end
