class ApplicationController < ActionController::API
	before_filter :set_current_user
	#protected or private?
	protected

	def authenticate!
		binding.pry
		unauthorized! unless current_user
	end

	def unauthorized!
		head :unauthorized
	end

	def current_user
		@current_user
	end

	def set_current_user
		token = request.headers['Authorization'].to_s.split(' ').last
		binding.pry
		return unless token

		payload = Token.new(token)

		@current_user = User.find(payload.user_id) if payload.valid?
		binding.pry
	end
end
