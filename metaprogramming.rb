class Task
  attr_accessor :status
  def initialize(status = 'new')
    @status = status
  end

  %w(new open done).each do |method|
    define_method(method + '?') { @status == method ? true : false }
    alias_method (method + '!'), (method + '?')
  end

  define_method('change_status') do |status|
    @status = status
  end

  # def change_status(status)
  #   @status = status
  # end
end

task1 = Task.new('new')
task2 = Task.new('open')

puts task1.new?
puts task1.open?

puts task2.done?
task2.change_status('done')
puts task2.done!

puts Task.new.send(:done?)