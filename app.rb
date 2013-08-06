require "nokogiri"
require "open-uri"

#page_uri = "http://www.nhl.com/ice/playersearch.htm"
#doc = Nokogiri::HTML(open(page_uri))
#doc.css("#playerSearch > .lastInitial > a").each do |link|
#  letter_uri = URI.join(page_uri, link["href"]).to_s
#  puts "got link: #{letter_uri}"
#end

def main
  task = ProcessLettersTask.new("http://www.nhl.com/ice/playersearch.htm")
  puts task.run
end

class ProcessLettersTask
  def initialize(uri)
    @uri = uri
  end

  def run
    doc = Nokogiri::HTML(open(@uri))
    doc.css("#playerSearch > .lastInitial > a").map do |link|
      URI.join(@uri, link["href"]).to_s
    end
  end
end

main