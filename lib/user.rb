require "mongo_mapper"

class User
    include MongoMapper::Document

    key :name, String

    def to_s
	"User{#{@_id}, #{@name}}"
    end
end
