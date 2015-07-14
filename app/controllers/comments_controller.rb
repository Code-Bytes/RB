class CommentsController < ApplicationController
	before_action :set_current_user
  before_action :authenticate!, only: [:create, :update, :destroy, :reply]

	def index
		@comments = Post.find(params[:post_id]).comments
		render json: @comments, status: :ok
	end

	def create
		post = Post.find(params[:post_id])
		@comment = Comment.new(	content:params[:content], 
														user:current_user, 
														post:post)											
		if @comment.save
			render json: @comment, status: :created
		else
			render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
	end

	def show
		@comment = Comment.find(params[:id])
		render json: @comment, status: :ok
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		render json: @comment, status: :ok
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		render json: {}, status: :ok
	end

	def reply
		comment = Comment.find(params[:id])
		@reply = comment.children.create(content:params[:content], 
																		 user:current_user, 
																		 post:comment.post)
																
		render json: @reply, status: :ok
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end