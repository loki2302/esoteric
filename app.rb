require "rubygems"
require "bundler/setup"

require "./crawler_context"
require "./process_letters_task"
require "./process_letter_task"
require "./process_player_task"

def main
  first_task = ProcessLettersTask.new("http://www.nhl.com/ice/playersearch.htm")
  context = CrawlerContext.new
  context.submit_task(first_task)

  num_of_threads = 40
  threads = []
  num_of_threads.times do
    thread = Thread.new do
      while !context.should_stop do
        task = context.get_task
        if task.nil?
          sleep 0.1
          next
        end

        task.run(context)
        context.notify_task_done
      end
    end

    threads << thread
  end

  threads.each do |thread|
    thread.join
  end
end

main