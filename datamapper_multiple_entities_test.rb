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
    user = User2.new(:name => "loki2302")
    user.save!
    assert_equal(1, User2.count)
    assert_equal(0, Post.count)

    post1 = Post.new(:text => "first post", :user2 => user)
    post1.save!
    assert_equal(1, User2.count)
    assert_equal(1, Post.count)

    post1 = Post.first
    assert_equal("first post", post1.text)
    assert_equal(1, post1.user2.id)
    assert_equal("loki2302", post1.user2.name)

    user = User2.first
    assert_equal(1, user.posts.count)
    assert_equal(1, user.posts.first.id)
  end
end

class User2
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  has n, :posts
end

class Post
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  belongs_to :user2
end

DataMapper.finalize