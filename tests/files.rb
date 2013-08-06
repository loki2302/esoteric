require 'test/unit'

class Files < Test::Unit::TestCase
  def test_can_read_and_write_text_file
    File.delete("1.txt") if File.exists?("1.txt")

    assert(!File.exists?("1.txt"))

    File.open("1.txt", "w") do |file|
      file.puts("hello")
    end

    assert(File.exists?("1.txt"))
    assert_equal(6, File.size("1.txt"))

    File.open("1.txt", "r") do |file|
      s = file.gets
      assert_equal("hello\n", s)
    end

    File.delete("1.txt")
    assert(!File.exists?("1.txt"))
  end
end