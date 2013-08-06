require "nokogiri"
require "open-uri"

def main
  first_task = ProcessLettersTask.new("http://www.nhl.com/ice/playersearch.htm")
  context = CrawlerContext.new
  context.submit_task(first_task)
  loop do
    task = context.get_task
    if task == nil
      break
    end

    puts "Running #{task}"
    task.run(context)
  end
end

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

class ProcessLetterTask
  def initialize(uri, process_pagination)
    @uri = uri
    @process_pagination = process_pagination
  end

  def run(context)
  end

  def to_s
    "ProcessLetterTask{#{@uri}}"
  end
end

class CrawlerContext
  def initialize
    @tasks = Queue.new
  end

  def submit_task(task)
    @tasks.push(task)
  end

  def get_task()
    @tasks.pop(true) rescue nil
  end
end

main