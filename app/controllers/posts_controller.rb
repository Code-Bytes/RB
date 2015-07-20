class PostsController < ApplicationController
  before_action :set_current_user
  before_action :authenticate!, only: [:create, :update, :delete]

  def create
    @post = Post.new(title: params[:title], content: params[:content], gist_id: params[:gist_id], user:current_user)
    @post.tag_list.add(params[:tags],parse:true) if params[:tags]
    if @post.save
      render json: @post, status: :ok
    else 
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.update(post_params)
      render json: @post, status: :ok
    else 
      render json: {message: "Not Authorized"}, status: :unauthorized
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      render json: @post, status: :ok
    else 
      render json: {message: "Not Authorized"}, status: :unauthorized
    end
  end

  def index
    params[:page] ? page = params[:page] : page = 1
    sort = params[:sort] 
    tags = params[:tags].gsub(/\s+/, "").split(",") if params[:tags]

    if tags 
      if sort 
        case sort
        when "new"
          @posts = Post.tagged_with(tags, any:true).recent.page(page)
        when "top"
          @posts = Post.tagged_with(tags, any:true).top.page(page)
        end
      else
        @posts = Post.tagged_with(tags, any:true).top.page(page)
      end
    else
      if sort
        case sort
        when "new"
          @posts = @posts.recent.page(page)
        when "top"
          @posts = @posts.top.page(page)
        end
      else
        @posts = @posts.top.page(page)
      end
    end

    render json: @posts, status: :ok
  end

  def show
    @post = Post.find(params[:id])    
    # if current_user
    #   @voted = current_user.voted_as_when_voted_for(@post)
    #   render json: {post: @post, voted: @voted}, status: :ok
    # else
    #   render json: @post, status: :ok
    # end
    render json: @post, status: :ok
  end

  def upvote
    @post = Post.find(params[:id])
    if @post.upvote_by current_user
      @post.vote_registered?
    render json: @post, status: :ok
    else 
      render json: @post, status: :unauthorized
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
    params.permit(:title, :content, :tag_names)
  end

end
