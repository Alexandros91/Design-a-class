require 'todo_tasks'

RSpec.describe TodoTasks do
  describe '#see_list' do

    context 'when we have not added a task yet' do
      it 'returns an empty list' do
        todo_task = TodoTasks.new
        expect(todo_task.see_list).to eq []
      end
    end
  end

  describe '#add' do

    context 'when we add an empty task' do
      it 'fails' do
        todo_task = TodoTasks.new
        expect { todo_task.add() }.to raise_error "No task is given"
      end
    end

    context 'when we add a task with a text' do
      it 'adds the task to the list' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog")
        expect(todo_task.see_list).to eq ["Walk the dog"]
      end
    end

    context 'when we add two tasks with two different entries' do
      it 'adds both entries to the list' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog")
        todo_task.add("Buy groceries")
        expect(todo_task.see_list).to eq ["Walk the dog", "Buy groceries"]
      end
    end

    context 'when we add two tasks in the same entry' do
      it 'adds both tasks to the list' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog", "Buy groceries")
        expect(todo_task.see_list).to eq ["Walk the dog", "Buy groceries"]
      end
    end

    context 'when we have duplicates' do
      it 'adds the task to the list once' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog")
        todo_task.add("Walk the dog")
        expect(todo_task.see_list).to eq ["Walk the dog"]
      end
    end
  end

  describe '#complete' do

    context 'when the list is empty' do
      it 'fails' do
        todo_task = TodoTasks.new
        expect { todo_task.complete("Walk the dog") }.to raise_error "The to do list is empty"
      end
    end

    context 'when the task is not found in the list' do
      it 'fails' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog")
        expect {todo_task.complete("Buy groceries") }.to raise_error 'This task was not found in the list'
      end
    end

    context 'when the task is found in the list' do
      it 'deletes the task from the list' do
        todo_task = TodoTasks.new
        todo_task.add("Walk the dog")
        todo_task.add("Buy groceries")
        todo_task.complete("Walk the dog")
        expect(todo_task.see_list).to eq ["Buy groceries"]
      end
    end
  end
end