require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.password = 'secret'
  end

  test "should get login when user not login" do
    get login_url
    assert_response :success
  end

  test "should redirect tweets_path when user login" do
    login_as(@user.name, @user.password)
    get login_url
    assert_redirected_to tweets_url
  end

  test "should create session when user does not have session" do
    post login_url, params: { user: { name: @user.name, password: @user.password } }
    assert_redirected_to tweets_url
  end

  test "should redirect login page when bad password" do
    post login_url, params: { user: { name: @user.name, password: 'wrong-password' } }
    assert_redirected_to login_url
  end

  test "should destroy session" do
    get logout_url
    assert_redirected_to login_url
  end
end
