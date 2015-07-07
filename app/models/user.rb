class User < ActiveRecord::Base

	def self.find_or_create_by_auth(github)

		github.get_data!
		data = github.data

		new_user = find_by(github: data['id']) || find_or_create_by(email: data['email']) do |user|
			user.password = SecureRandom.hex
		end

		new_user.update(
      username: data['login'],
      email: data['email'],
 			github: data['id'],
 			avatar: data['avatar_url']
    )

		new_user

	end


end