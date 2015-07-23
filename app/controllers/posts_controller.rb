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
    params[:page] ? page = params[:page].to_i : page = 1
    sort = params[:sort] 

    if params[:tags]
      stripped_tags = params[:tags].gsub(/\s+/, "")
      tags = stripped_tags.split(",") 
    end

    if page == 1
      page_prev = nil
      page_next = '2'
    else
      page_prev = (page - 1).to_s
      page_next = (page + 1).to_s
    end

    next_page_params ={
      page: page_next,
      sort: sort,
      tags: stripped_tags
    }.reject{ |k,v| v.nil? }.to_query

    prev_page_params ={
      page: page_prev,
      sort: sort,
      tags: stripped_tags
    }.reject{ |k,v| v.nil? }.to_query

    if tags 
      if sort 
        case sort
        when "new"
          @posts = Post.tagged_with(tags).recent.page(page)
        when "top"
          @posts = Post.tagged_with(tags).top.page(page)
        end
      else
        @posts = Post.tagged_with(tags).top.page(page)
      end
    else
      if sort
        case sort
        when "new"
          @posts = Post.recent.page(page)
        when "top"
          @posts = Post.top.page(page)
        end
      else
        @posts = Post.top.page(page)
      end
    end

    render json: @posts, 
    :meta => {
      :total => Post.count, 
      :prev => prev_page_params, 
      :next => next_page_params}, status: :ok
  end

  def show
    @post = Post.find(params[:id])    
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
