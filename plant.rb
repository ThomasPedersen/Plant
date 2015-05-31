require 'rubygems'
require 'serialport'

serialport = SerialPort.new("/dev/tty.usbmodemfd121", 9600, 8, 1, SerialPort::NONE)

file = File.open("samples.csv", 'a')

trap("INT") { file.close(); exit }

while true do
	
	while (line = serialport.gets.chomp) do

		a = line.split(',')
		a.unshift (Time.now.utc.to_f * 1000).to_i.to_s
		a.unshift Time.now.to_s

		if (a.count == 4) then
			puts a.join(',')
			file.puts a.join(',')
		end

	end
end