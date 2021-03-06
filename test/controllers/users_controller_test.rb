require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'new_user', password: 'secret' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should not create user when same name" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: @user.name, password: 'secret' } }
    end
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name, password: 'secret' } }
    assert_redirected_to user_url(@user)
  end

  test "should update user when exist name" do
    User.create(name: 'hoge', password: 'secret')

    patch user_url(@user), params: { user: { name: 'hoge', password: 'secret' } }
    @user.reload
    assert_not_equal @user.name, 'hoge'
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
