require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get welcome_profile_url
    assert_response :success
  end

end
