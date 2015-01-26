require './metaprogramming.rb'

describe 'Task' do

  context 'create new task without param in constructor' do
    it { expect(Task.new.send(:new?)).to be true }
    it { expect(Task.new.send(:done?)).to be false }
  end

  context 'create new tast' do
    it 'returns task status' do
      task = Task.new('open')
      expect(task.open?).to be true
    end

    it 'returns task status' do
      task = Task.new('done')
      expect(task.open?).to be false
    end

    it 'returns task status' do
      task = Task.new('new')
      task.change_status('open')
      expect(task.open?).to be true
    end

  end
end