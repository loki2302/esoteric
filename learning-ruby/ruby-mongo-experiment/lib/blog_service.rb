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
    user = User.find_by_name(username)
    if user.nil?
      user = User.new(:name => username)
      user.save!
    end

    token = SecureRandom.uuid
    session = Session.new(:token => token, :user => user)
    session.save!

    session.token
  end

  def get_user_info(token)
    user = get_user_or_throw(token)
    post_count = user.posts.count

    {
      :username => user.name,
      :post_count => post_count
    }
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

  def get_post(token, post_id)
    user = get_user_or_throw(token)
    post = get_post_or_throw(user, post_id)
    post
  end

  def delete_post(token, post_id)
    user = get_user_or_throw(token)
    post = get_post_or_throw(user, post_id)
    post.destroy
  end

  private

  def get_user_or_throw(token)
    session = Session.find_by_token(token)
    if session.nil?
      raise InvalidSessionTokenException
    end

    return session.user
  end

  def get_post_or_throw(user, post_id)
    post = Post.find(post_id)
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