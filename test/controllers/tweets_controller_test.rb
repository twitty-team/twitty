require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @tweet = tweets(:one)
  end

  test "should redirect when user does not login" do
    get new_tweet_url
    assert_redirected_to login_url
  end

  test "should get index" do
    get tweets_url
    assert_response :success
  end

  test "should get new" do
    login_as(@user.name, 'secret')
    get new_tweet_url
    assert_response :success
  end

  test "should create tweet" do
    assert_difference('Tweet.count') do
      login_as(@user.name, 'secret')
      post tweets_url, params: { tweet: { body: @tweet.body } }
    end

    assert_redirected_to tweet_url(Tweet.last)
  end

  test "should create tweet when not valid tweet" do
    assert_no_difference('Tweet.count') do
      login_as(@user.name, 'secret')
      post tweets_url, params: { tweet: { body: 'h' * 141 } }
    end

    assert_response :success
  end

  test "should show tweet" do
    login_as(@user.name, 'secret')
    get tweet_url(@tweet)
    assert_response :success
  end

  test "should get edit" do
    login_as(@user.name, 'secret')
    get edit_tweet_url(@tweet)
    assert_response :success
  end

  test "should update tweet" do
    login_as(@user.name, 'secret')
    patch tweet_url(@tweet), params: { tweet: { body: @tweet.body } }
    assert_redirected_to tweet_url(@tweet)
  end

  test "should not update tweet not update over 140" do
    login_as(@user.name, 'secret')
    patch tweet_url(@tweet), params: { tweet: { body: 'h' * 141 } }
    assert_equal Tweet.last.body, @tweet.body
    assert_response :success
  end

  test "should destroy tweet" do
    login_as(@user.name, 'secret')
    assert_difference('Tweet.count', -1) do
      delete tweet_url(@tweet)
    end

    assert_redirected_to tweets_url
  end
end
