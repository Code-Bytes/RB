class TagsController < ApplicationController
  
  def index
  	@tags = ActsAsTaggableOn::Tag.all
  	search = params[:search]
  	if search 
  		@tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{search}%")
  	end
    @tags = @tags.map {|t| {name: t.name} }.to_json
  	render json: @tags, status: :ok
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    render json: @tag, status: :ok
  end
end