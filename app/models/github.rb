class Github

	#fix these
	HOST = 'https://api.github.com'
	ACCESS_TOKEN_URL = 'https://github.com/login/oauth/access_token'
	DATA_URL = HOST + '/user'

	attr_reader :data, :access_token

	def initialize(params)
		@params = {
			code: params[:code],
			redirect_uri: params[:redirectUri],
			client_id: params[:clientId],
			client_secret: Rails.application.secrets['github_oauth_secret']
		}

		#how does this work exactly
		@access_token = params[:access_token].presence || get_access_token!
		@data = nil
	end

	def get_access_token!
		response = RestClient.post(ACCESS_TOKEN_URL, @params, :accept => :json)
		JSON.parse(response)['access_token']
	end

	def get_data!
		response = RestClient.get(DATA_URL,{params: {access_token: @access_token}, accept: :json})
		# response = RestClient.get(DATA_URL, @access_token)
		@data = JSON.parse(response.body)
	end

end