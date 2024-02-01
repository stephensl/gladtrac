require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "valid login" do
    user = users(:one)
    post login_path, params: { session: { email: user.email, password: 'password' } }
    assert_redirected_to user_path(user)
    follow_redirect!
    assert_template 'users/show'
  end
end
