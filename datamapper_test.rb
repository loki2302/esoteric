require "test/unit"
require "data_mapper"
require "dm-migrations"

class DataMapperTest < Test::Unit::TestCase
  def setup    
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "sqlite::memory:")
    DataMapper.auto_migrate!
  end

  def test_datamapper_even_works
    user = User.new(:name => "loki2302")
    assert_nil(user.id)
    user.save!
    assert_equal(1, user.id)

    user = User.get(1)
    assert_equal("loki2302", user.name)

    user = User.get!(1)
    assert_equal("loki2302", user.name)

    user = User.get(2)
    assert_nil(user)

    begin
      user = User.get!(2)
      assert_fail
    rescue DataMapper::ObjectNotFoundError
    end

    user = User.first
    assert_equal("loki2302", user.name)

    user = User.last
    assert_equal("loki2302", user.name)

    users = User.all
    assert_equal(1, users.count)
    assert_equal(1, User.count)
  end

  def test_can_update_user
    user = User.new(:name => "loki2302")
    user.save!
    assert_not_nil(user.id)

    user_id = user.id
    user = User.get(user_id)
    assert_equal("loki2302", user.name)

    user.update(:name => "not loki2302")

    user = User.get(user_id)
    assert_equal("not loki2302", user.name)
  end

  def test_can_delete_use
    user = User.new(:name => "loki2302")
    user.save!
    assert_equal(1, User.count)

    user.destroy
    assert_equal(0, User.count)
  end
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
end

DataMapper.finalize