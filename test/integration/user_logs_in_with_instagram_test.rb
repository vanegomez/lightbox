require "test_helper"
class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Lightbox::Application
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
  end
end
