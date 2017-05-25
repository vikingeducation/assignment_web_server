require 'socket'
require 'open-uri'

# IP address is 0.0.0.0 and it's on port 8080:
port = 8080
server = TCPServer.new('0.0.0.0', port)
puts "Server running on port #{port}."

loop do
  connection = server.accept
  inputline = connection.gets

  connection.puts inputline
  connection.puts 'Hello World'

  file_name = File.new(File.join(File.dirname(__FILE__), 'hello.html'))
  File.new(file_name).each_line do |line|
    connection.puts line
  end
  connection.close
end

