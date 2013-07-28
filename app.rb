require "sinatra"
require "json"

set :environment, :production # required for "error" handler

get "/" do
    erb :index
end

get "/time" do
    @time = Time.now
    erb :time
end

get "/about" do
    erb :about
end

get "/add/:a/:b" do
    @a = Integer(params[:a])
    @b = Integer(params[:b])
    @result = @a + @b
    erb :add
end

get "/json" do
    content_type :json
    { :name => "loki2302" }.to_json
end

not_found do
    erb :not_found
end

error do
    erb :error
end