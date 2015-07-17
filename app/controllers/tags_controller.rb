class TagsController < ApplicationController
  
  def index
  	@tags = ActsAsTaggableOn::Tag.all
  	render json: @tags, status: :ok
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    render json: @tag, status: :ok
  end
end