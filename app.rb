require "rubygems"
require "bundler/setup"

require "nokogiri"
require "open-uri"

def main
  first_task = ProcessLettersTask.new("http://www.nhl.com/ice/playersearch.htm")
  context = CrawlerContext.new
  context.submit_task(first_task)
  processed_task_count = 0
  loop do
    task = context.get_task
    if task == nil
      break
    end

    total_task_count = context.get_total_task_count
    puts "[#{processed_task_count}/#{total_task_count}] Running #{task}"
    task.run(context)
    processed_task_count += 1
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
    doc = Nokogiri::HTML(open(@uri))
    doc.css("table.data > tbody > tr a[href*=player]").each do |link|
      player_uri = URI.join(@uri, link["href"])
      task = ProcessPlayerTask.new(player_uri)
      context.submit_task(task)
    end

    if !@process_pagination
      return
    end

    doc.css(".pageNumbers > a").each do |link|
      page_uri = URI.join(@uri, link["href"])
      task = ProcessLetterTask.new(page_uri, false)
      context.submit_task(task)
    end
  end

  def to_s
    "ProcessLetterTask{#{@uri}}"
  end
end

class ProcessPlayerTask
  def initialize(uri)
    @uri = uri
  end

  def run(context)
    doc = Nokogiri::HTML(open(@uri))
    name_element = doc.css("#tombstone h1 *").first
    player_name = name_element.inner_text.strip # TODO: how do I remove player number?
    puts "Got player: '#{player_name}'"
  end

  def to_s
    "ProcessPlayerTask{#{@uri}}"
  end
end

class CrawlerContext
  def initialize
    @tasks = Queue.new
    @total_task_count = 0
  end

  def submit_task(task)
    @tasks.push(task)
    @total_task_count += 1
  end

  def get_task
    @tasks.pop(true) rescue nil
  end

  def get_total_task_count
    @total_task_count
  end
end

main