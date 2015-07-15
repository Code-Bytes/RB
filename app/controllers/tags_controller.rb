class TagsController < ApplicationController
  def show
    @tag = Tag.find_by!(name: params[:name])
    @posts = @tag.posts.order(written_at: :desc).page(page).per(25)
    render json: @tag, status: :ok
  end
end