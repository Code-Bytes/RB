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
      @post.destroy
      render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  def index
    @post = Post.order(cached_votes_up: :desc)
    render json: @post, status: :ok
  end

  def show
    @post = Post.find(params[:id])
    @post.cached_votes_total
    @post.cached_votes_up
    @post.cached_votes_down
    render json: @post, status: :ok
  end

  def upvote
    @post = Post.find(params[:id])
    if @post.upvote_by current_user
      @post.vote_registered?
    render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  def downvote
    @post = Post.find(params[:id])
    if @post.downvote_by current_user
      @post.vote_registered?
    render json: @post, status: :ok
    else 
      render json: @post, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :tag_names)
  end

end
