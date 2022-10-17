class TodoTasks

  def initialize
    @tasks = []
    @completed_tasks = []
  end

  def add(*task)
    @tasks << task
    @tasks.flatten!.uniq!
    fail no_task_given_error_message if task.empty?
  end

  def complete(task)
    fail empty_list_error_message if @tasks.empty?
    fail no_listed_task_error_message unless @tasks.include?(task)
    @completed_tasks << @tasks.delete(task)
  end
  
  def see_list
    @tasks
  end

  private

  def no_task_given_error_message
    "No task is given"
  end

  def empty_list_error_message
    'The to do list is empty'
  end

  def no_listed_task_error_message
    'This task was not found in the list'
  end

end