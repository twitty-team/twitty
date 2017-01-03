require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.password = 'secret'
  end

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should create session" do
    post login_url, params: { user: { name: @user.name, password: @user.password } }
    assert_response :found
  end
end
