require './metaprogramming.rb'

describe 'Task' do
  context 'create new task without status in constructor' do
    it { expect(Task.new.send(:new?)).to be true }
    it { expect(Task.new.send(:done?)).to be false }
  end

  it 'returns true if status is open' do
    task = Task.new('open')
    expect(task.open?).to be true
  end

  it 'returns false if status is not done' do
    task = Task.new('open')
    task.done!
    expect(task.open?).to be false
  end

  it 'changes status to open' do
    task = Task.new('new')
    task.open!
    expect(task.open?).to be true
  end
end