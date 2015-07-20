Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['instagram_key'], ENV['instagram_secret']
end
