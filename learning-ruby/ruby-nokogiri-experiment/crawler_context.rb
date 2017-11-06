class CrawlerContext
  def initialize
    @tasks = Queue.new
    @total_task_count = 0
    @pending_task_count = 0
    @player_count = 0
    @lock = Mutex.new
  end

  def submit_task(task)
    @lock.synchronize do
      @tasks.push(task)
      @total_task_count += 1
      @pending_task_count += 1
    end
  end

  def notify_task_done
    @lock.synchronize do
      @pending_task_count -= 1
    end
  end

  def submit_result(player_name)
    @lock.synchronize do
      @player_count += 1
      puts "got result: #{player_name} (#{@player_count} players)"
    end
  end

  def get_task
    @tasks.pop(true) rescue nil
  end

  def get_total_task_count
    @total_task_count
  end

  def should_stop
    @pending_task_count == 0
  end

  def get_player_count
    @player_count
  end
end