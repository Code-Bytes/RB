class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates_uniqueness_of :email, :github
  acts_as_voter

  def self.find_or_create_by_auth(github)

    github.get_data!
    data = github.data


    user = User.find_or_create_by(github: data['id'], email: data['email'])
    user.update(username: data['login'],
                password: SecureRandom.hex,
                github: data['id'],
                avatar: data['avatar_url'],
                company: data['company'],
                url: data['html_url'],
                blog: data['blog'],
                location: data['location'],
                follower_count: data['followers'],
                following_count: data['following'],
                public_gists: data['public_gists'],
                hireable: data['hireable'])

    user
  end
end
