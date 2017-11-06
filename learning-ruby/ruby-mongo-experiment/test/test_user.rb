require "test/unit"
require "user"
require "post"
require "session"

class TestUser < Test::Unit::TestCase
  def setup
    reset
    end

  def teardown
    reset
    end

  def reset
    connection = Mongo::Connection.new("win7dev-home")
    connection.drop_database("ruby-experiment")

    MongoMapper.connection = connection
    MongoMapper.database = "ruby-experiment"
  end

  def test_there_are_no_users_by_default
    assert_equal(0, User.count)
  end

  def test_there_are_no_posts_by_default
    assert_equal(0, Post.count)
  end

  def test_can_create_user
    user = User.new(:name => "loki2302")
    user.save!
    assert_equal("loki2302", user.name)
    assert_equal(0, user.posts.count)
    assert_equal(1, User.count)

    u = User.where(:name => "loki2302").first
    assert_equal("loki2302", u.name)
    assert_equal(0, user.posts.count)

    User.delete(u._id)
    assert_equal(0, User.count)
  end

  def test_can_create_user_with_posts
    user = User.new(:name => "loki2302")
    user.save!

    post = Post.new(:text => "hello", :user => user)
    post.save!
    assert_equal(1, user.posts.count)
  end
end