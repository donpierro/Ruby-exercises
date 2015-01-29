class Task
  attr_accessor :status
  def initialize(status = 'new')
    @status = status
  end

  %w(new open done).each do |method|
    define_method(method + '?') { @status == method ? true : false }
    define_method(method + '!') { @status = method }
  end
end