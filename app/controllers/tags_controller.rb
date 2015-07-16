class TagsController < ApplicationController
  
  def index
  	@tag = Tag.order(written_at: :desc).page(page).per(25)
  	render json: @tag, status: :ok
  end

  def show
    @tag = Tag.find_by!(name: params[:name]).page(page).per(25)
    @posts = @tag.posts.order(written_at: :desc).page(page).per(25)
    render json: {tag: @tag, posts: @posts}, status: :ok
  end
end