require './metaprogramming.rb'

describe 'Task' do
  context 'create new task' do
    it 'creates task with default status' do
      expect(Task.new).to be_new
    end
    it 'creates task with open status' do
      expect(Task.new('open')).to be_open
    end
  end

  context 'change task status' do
    let!(:task) { Task.new }

    it 'changes task status for open' do
      task.open!
      expect(task.status).to eql('open') 
    end
    it 'changes task status for done' do
      task.done!
      expect(task.status).to eql('done')
    end
    it 'changes task status for open' do
      task = Task.new('open')
      task.new!
      expect(task.status).to eql('new') 
    end
  end

  context 'check task status' do
    let!(:task) { Task.new }

    it 'checks if status is new' do
      expect(task).to be_new
    end

    it 'checks if status is open' do
      task.open!
      expect(task).to be_open
    end

    it 'checks if status is done' do
      task.done!
      expect(task).to be_done
    end
  end
end