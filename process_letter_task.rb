require 'nokogiri'
require 'open-uri'

class ProcessLetterTask
  def initialize(uri, process_pagination)
    @uri = uri
    @process_pagination = process_pagination
  end

  def run(context)
    doc = Nokogiri::HTML(open(@uri))
    doc.css('table.data > tbody > tr a[href*=player]').each do |link|
      player_uri = URI.join(@uri, link['href'])
      task = ProcessPlayerTask.new(player_uri)
      context.submit_task(task)
    end

    if !@process_pagination
      return
    end

    page_uris = doc.css('.pageNumbers > a').map do |link|
      URI.join(@uri, link['href'])
    end

    page_uris.uniq!

    page_uris.each do |page_uri|
      task = ProcessLetterTask.new(page_uri, false)
      context.submit_task(task)
    end
  end

  def to_s
    "ProcessLetterTask{#{@uri}}"
  end
end