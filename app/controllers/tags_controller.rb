class TagsController < ApplicationController
  
  def index
    search = params[:search]
    if search 
      @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{search}%")
    else
  	  @tags = ActsAsTaggableOn::Tag.all
    end
    @tags = @tags.map {|t| {text: t.name} }.to_json
  	render json: @tags, status: :ok
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    render json: @tag, status: :ok
  end
end