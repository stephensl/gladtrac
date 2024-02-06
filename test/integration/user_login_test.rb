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

  test "user cannot log in with invalid credentials" do
    user = users(:one)
    get new_user_session_path
    assert_response :success
  
    post user_session_path, params: { user: { email: user.email, password: 'wrongpassword' } }
    assert_response :unprocessable_entity # Or whatever your app does in this scenario
    assert_select 'div.alert', 'Invalid Email or password.' # Assuming you show an error message
  end

  test "user can log out" do
    user = users(:one)
    sign_in user
    delete destroy_user_session_path
    assert_redirected_to root_path # Assuming your app redirects to root after logout
    follow_redirect!
    assert_select 'a', 'Sign In' # Check for sign in link as proof of logout
  end
  
  
end
