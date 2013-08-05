require "test/unit"
require "sqlite3"

class SqliteTest < Test::Unit::TestCase
  def test_sqlite_even_works
    db = SQLite3::Database.new(":memory:")
    db.execute <<-SQL
      create table persons(
        id integer primary key,
        name nvarchar(256),
        age int
      )
    SQL

    [
      ["loki2302", 123],
      ["another loki2302", 234]
    ].each do |person|
      db.execute("insert into persons(name, age) values(?, ?)", person)
    end

    db.execute("select id, name, age from persons") do |row|
      puts("got row #{row}")
    end

    rows = db.execute("select id, name, age from persons")
    assert_equal([1, "loki2302", 123], rows[0])
    assert_equal([2, "another loki2302", 234], rows[1])
  end
end