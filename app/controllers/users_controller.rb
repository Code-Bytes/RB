class UsersController < ApplicationController

  def index
      @users = User.order(created_at: :desc)
      render json: @users, status: :ok
  end

  def find
      @user = User.find(params[:id])
      render json: @user, status: :ok
  end

  def posts
      user = User.find(params[:id])
      @posts = user.posts.order(created_at: :desc)
      render json: @posts, status: :ok
  end

end