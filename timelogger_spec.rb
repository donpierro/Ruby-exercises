require './timelogger.rb'

describe 'TimeLogger' do
  context 'timer function' do
    it {
      expect{ TimeLogger.new.timer }.to output(%(Current time: #{Time.now.strftime("%H:%M:%S")}\n)).to_stdout
    }
    it {
      str = %(Begin time: #{Time.now.strftime("%H:%M:%S")}\n) +
            %(123\n) +
            %(End time: #{Time.now.strftime("%H:%M:%S")}\n)
      expect{ TimeLogger.new.timer {puts '123'} }.to output(str).to_stdout
    }
  end
  context 'mid_timer' do
    it {
      str = %(Begin time: #{Time.now.strftime("%H:%M:%S")}\n) +
            %(111\n) +
            %(Mid time: #{Time.now.strftime("%H:%M:%S")}\n) +
            %(222\n) +
            %(End time: #{Time.now.strftime("%H:%M:%S")}\n)
      expect{ TimeLogger.new.mid_timer ->{puts '111'}, ->{puts '222'} }.to output(str).to_stdout
    }
  end
end