require "test/unit"
require "data_mapper"
require "dm-migrations"

class DataMapperMultipleEntitiesTest < Test::Unit::TestCase
  def setup
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "sqlite::memory:")
    DataMapper.auto_migrate!
  end

  def test_can_use_multiple_entities
    user = PostingUser.new(:name => "loki2302")
    user.save!
    assert_equal(1, PostingUser.count)
    assert_equal(0, Post.count)

    post1 = Post.new(:text => "first post", :posting_user => user)
    post1.save!
    assert_equal(1, PostingUser.count)
    assert_equal(1, Post.count)

    post1 = Post.first
    assert_equal("first post", post1.text)
    assert_equal(1, post1.posting_user.id)
    assert_equal("loki2302", post1.posting_user.name)

    user = PostingUser.first
    assert_equal(1, user.posts.count)
    assert_equal(1, user.posts.first.id)
  end

  def test
    user1 = PostingUser.create(:name => "loki2302")
    user1post1 = Post.create(:text => "loki2302 post1", :posting_user => user1)
    user1post2 = Post.create(:text => "loki2302 post2", :posting_user => user1)

    user2 = PostingUser.create(:name => "qwerty")
    user2post1 = Post.create(:text => "qwerty post1", :posting_user => user2)
    user2post2 = Post.create(:text => "qwerty post2", :posting_user => user2)
    user2post3 = Post.create(:text => "qwerty post3", :posting_user => user2)

    assert_equal(5, Post.count)
    assert_equal(2, user1.posts.count)
    assert_equal(3, user2.posts.count)

    assert_equal(5, Post.count(:text.like => "%post%"))
    assert_equal(2, Post.count(:text.like => "%post1%"))
    assert_equal(2, Post.count(:text.like => "%loki2302%"))
    assert_equal(3, Post.count(:text.like => "%qwerty%"))
  end
end

class PostingUser
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  has n, :posts
end

class Post
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  belongs_to :posting_user
end

DataMapper.finalize