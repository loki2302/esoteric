require "nokogiri"
require "open-uri"

class ProcessPlayerTask
  def initialize(uri)
    @uri = uri
  end

  def run(context)
    doc = Nokogiri::HTML(open(@uri))
    name_element = doc.css("#tombstone h1 *").first
    player_name = name_element.inner_text.strip # TODO: how do I remove player number?
    context.submit_result(player_name)
  end

  def to_s
    "ProcessPlayerTask{#{@uri}}"
  end
end