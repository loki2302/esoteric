require "mongo_mapper"

class User
  include MongoMapper::Document

  key :name, String
  many :sessions
  many :posts

  def to_s
    "User{#{@_id}, #{@name}, #{@posts.count}}"
  end
end


