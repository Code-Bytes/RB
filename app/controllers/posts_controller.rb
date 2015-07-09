class PostsController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :delete]

  def create
  end

  def update
  end

  def destroy
  end

  def index
  end
end
