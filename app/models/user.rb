class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)

    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.name = oauth.info.name
    user.nickname = oauth.info.nickname
    user.website = oauth.info.website
    user.image = oauth.info.image
    user.token = oauth.info.token
    user.save

    user
  end
end