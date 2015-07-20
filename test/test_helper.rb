ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = Lightbox::Application
  end

  def stub_omniauth(name, nickname)
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
        provider: 'instagram',
        uid: "1234",
        info: {
          name: name,
          nickname: nickname,
        },
        credentials: {
          token: "pizza",
          secret: "secretpizza"
        }
      })
  end
end
