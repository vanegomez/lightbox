require "test_helper"
class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest

  test "logging in" do
    stub_omniauth("Horace", "worace")

    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    assert page.has_content?("worace")
    assert page.has_link?("logout")
  end
end


#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=false token="184611569.7493379.f2178e385a314168978c94ea773ebf0e"> extra=#<OmniAuth::AuthHash> info=#<OmniAuth::AuthHash::InfoHash bio="Something about Vanessa..." image="https://instagramimages-a.akamaihd.net/profiles/profile_184611569_75sq_1382965661.jpg" name="Vane" nickname="vanenag" website="http://www.idonthaveone.com"> provider="instagram" uid="184611569">
