require "test/unit"
require "data_mapper"
require "dm-migrations"

class DataMapperTest < Test::Unit::TestCase
  def test_datamapper_even_works
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "sqlite::memory:")
    DataMapper.auto_migrate!

    user = User.new(:name => "loki2302")
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
  end
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
end

DataMapper.finalize