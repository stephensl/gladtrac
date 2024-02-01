require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "user can log in with valid credentials" do
    user = users(:one)
    get new_user_session_path
    assert_response :success

    post user_session_path, params: { user: { email: user.email, password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end
end
