require "mongo_mapper"

class Session
  include MongoMapper::Document

  key :token, String
  belongs_to :user

  def to_s
    "Session{#{@_id}, #{@token}, #{@user}}"
  end
end

