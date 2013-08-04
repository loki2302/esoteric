require "test/unit"
require "blog_service"

class TestBlogService < Test::Unit::TestCase
  def setup
    reset
  end

  def teardown
    reset
  end

  def reset
    @service = BlogService.new({
      :mongoHost => "win7dev-home",
      :mongoDatabase => "ruby-experiment"
    })
    @service.reset
  end

  def test_can_authenticate
    token1 = @service.authenticate("loki2302")
    assert_not_nil(token1)

    token2 = @service.authenticate("loki2302")
    assert_not_equal(token1, token2)
  end

  def test_can_get_username_by_session_token
    token = @service.authenticate("loki2302")
    username = @service.ping(token)
    assert_equal("loki2302", username)
  end

  def test_throws_on_bad_session_token
    assert_raise(InvalidSessionTokenException) do
      @service.ping("qwerty")
    end
  end

  def test_can_create_post
    token = @service.authenticate("loki2302")
    post = @service.create_post(token, "hello there")
    assert_not_nil(post._id)
    assert_equal("hello there", post.text)
    assert_equal("loki2302", post.user.name)
  end

  def test_can_update_post
    token = @service.authenticate("loki2302")
    post = @service.create_post(token, "hello there")
    post = @service.update_post(token, post._id, "qwerty")
    assert_equal("qwerty", post.text)
  end

  def test_cant_update_post_that_does_not_belong_to_the_user
    token1 = @service.authenticate("loki2302")
    post = @service.create_post(token1, "hello there")

    token2 = @service.authenticate("hacker")
    assert_raise(PostDoesNotBelongToTheUser) do
      @service.update_post(token2, post._id, "qwerty")
    end
  end
end