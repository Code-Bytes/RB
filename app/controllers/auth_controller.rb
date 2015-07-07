class AuthController < ApplicationController

	def github
		#coordinate the params being passed into the github class
		@oauth = Github.new(params)
		@user = User.for_oauth(@oauth)

		render json: { token: Token.encode(@user.id) }
	end

end