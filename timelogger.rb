class TimeLogger
  def timer
    if !block_given?
      puts %(Current time: #{Time.now.strftime("%H:%M:%S")})
      return
    end
    puts %(Begin time: #{Time.now.strftime("%H:%M:%S")})
    yield
    puts %(End time: #{Time.now.strftime("%H:%M:%S")})
  end

  def mid_timer(block1, block2)
    puts %(Begin time: #{Time.now.strftime("%H:%M:%S")})
    block1.()
    puts %(Mid time: #{Time.now.strftime("%H:%M:%S")})
    block2.()
    puts %(End time: #{Time.now.strftime("%H:%M:%S")})
  end
end

# TimeLogger.new.timer { 111.times { print '.'}}
# TimeLogger.new.timer 
# TimeLogger.new.mid_timer ->{ puts '1' }, ->{ puts '2'}