require "mongo_mapper"
require "user"
require "session"
require "post"

class BlogService
  def initialize(options = {})
    @connection = Mongo::Connection.new(options[:mongoHost])
    MongoMapper.connection = @connection
    MongoMapper.database = options[:mongoDatabase]
  end

  def reset
    @connection.drop_database(MongoMapper.database.name)
  end

  def authenticate(username)
    user = User.where(:name => username).first
    if user.nil?
      user = User.new(:name => username)
      user.save!
    end

    token = SecureRandom.uuid
    session = Session.new(:token => token, :user => user)
    session.save!

    session.token
  end

  def ping(token)
    user = get_user_or_throw(token)
    user.name
  end

  def create_post(token, text)
    user = get_user_or_throw(token)
    post = Post.new(:user => user, :text => text)
    post.save!
    post
  end

  def update_post(token, post_id, text)
    user = get_user_or_throw(token)
    post = get_post_or_throw(user, post_id)
    post.text = text
    post.save!
    post
  end

  private

  def get_user_or_throw(token)
    session = Session.where(:token => token).first
    if session.nil?
      raise InvalidSessionTokenException
    end

    return session.user
  end

  def get_post_or_throw(user, post_id)
    post = Post.where(:_id => post_id).first
    if post.nil?
      raise NoSuchPostException
    end

    if post.user != user
      raise PostDoesNotBelongToTheUser
    end

    post
  end
end

class InvalidSessionTokenException < RuntimeError
end

class NoSuchPostException < RuntimeError
end

class PostDoesNotBelongToTheUser < RuntimeError
end