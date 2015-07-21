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

  def instagram_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "PuJkMZeoVaT8UCfjXhr5p0dYj"
      config.consumer_secret = "9VGchuYmqLlxbVyu4agDrlHD9uX6tIK3KOpc55IYWwFmplE62R"
      config.access_token = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end
end
