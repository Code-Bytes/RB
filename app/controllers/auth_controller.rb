class AuthController < ApplicationController

	def github
		#coordinate the params being passed into the github class
		github = Github.new(params)
		@user = User.find_or_create_by_auth(github)
		render json: { 
			token: Token.encode(@user.id), 
			user: @user
			}
		}
	end

end