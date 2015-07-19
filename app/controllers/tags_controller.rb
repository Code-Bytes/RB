class TagsController < ApplicationController
  
  def index
    search = params[:search]
    if search 
      @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{search}%").order(:taggings_count => :desc)
    else
  	  @tags = ActsAsTaggableOn::Tag.order(:taggings_count => :desc)
    end
    @tags = @tags.map {|t| {text: t.name} }.to_json
  	render json: @tags, status: :ok
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    render json: @tag, status: :ok
  end
end