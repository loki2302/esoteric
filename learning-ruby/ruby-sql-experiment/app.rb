require "rubygems"
require "bundler/setup"

require "sqlite3"

File.delete("test.db") if File.exists?("test.db")

# db = SQLite3::Database.new "test.db"
db = SQLite3::Database.new ":memory:"

db.execute <<-SQL
  create table persons(
    id integer primary key,
    name nvarchar(256),
    age integer
  )
SQL

[
  ["loki2302", 123],
  ["another loki2302", 234]
].each do |person|
  db.execute "insert into persons(name, age) values(?, ?)", person
end

db.execute "select id, name, age from persons" do |row|
  puts "row: #{row}"
end