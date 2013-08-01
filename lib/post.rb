require "mongo_mapper"

class Post
    include MongoMapper::Document

    key :text, String
    belongs_to :user

    def to_s
	"Post{#{@_id}, #{@text}} by #{@user}"
    end
end
