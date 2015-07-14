class User < ActiveRecord::Base

	has_many :posts, dependent: :destroy

	def self.find_or_create_by_auth(github)

		github.get_data!
		data = github.data

		new_user = find_by(github: data['id']) || find_or_create_by(github: data['id']) do |user|
			user.password = SecureRandom.hex
		end

		new_user.update(
      username: data['login'],
      email: data['email'],
 			github: data['id'],
 			avatar: data['avatar_url'],
 			company: data['company'],
 			url: data['html_url'],
 			blog: data['blog'],
 			location: data['location'],
 			follower_count: data['followers'],
 			following_count: data['following'],
 			public_gists: data['public_gists'],
 			hireable: data['hireable']
    )

		new_user

	end


end