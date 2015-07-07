class User < ActiveRecord::Base

	def self.find_or_create_by_auth(github)

		github.get_data!
		data = github.data

		#better way to find and set users?

		#why is the password necessary?
		user = find_by(github: data[:id]) || find_or_create_by(email: data[:email]) do |user|
			user.password = SecureRandom.hex
		end

		user.update(
			username: data[:username],
			email: data[:email],
			github: data[:id]
			)

		user
	end

	def displayName= name
		self.displayName = name
	end

end