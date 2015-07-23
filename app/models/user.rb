class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)

    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.name = oauth.info.name
    user.nickname = oauth.info.nickname
    user.website = oauth.info.website
    user.image = oauth.info.image
    user.token = oauth.credentials.token
    user.save

    user
  end

  def instagram_client
    @instagram_client ||= Instagram.client(access_token: token)
  end

  def feed
    instagram_client.user_media_feed
  end

  def recent
    instagram_client.user_recent_media
  end

  def counts
    instagram_client.user.counts
  end

  def recent_media
    instagram_client.user_recent_media
  end
end
