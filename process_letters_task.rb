require "nokogiri"
require "open-uri"

class ProcessLettersTask
  def initialize(uri)
    @uri = uri
  end

  def run(context)
    doc = Nokogiri::HTML(open(@uri))
    doc.css("#playerSearch > .lastInitial > a").each do |link|
      letter_uri = URI.join(@uri, link["href"]).to_s
      task = ProcessLetterTask.new(letter_uri, true)
      context.submit_task(task)
    end
  end

  def to_s
    "ProcessLettersTask{#{@uri}}"
  end
end