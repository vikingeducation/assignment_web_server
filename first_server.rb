# first_server.rb
require 'socket'

# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept   # Open connection
  inputline = connection.gets  # Read from connection

  html_string = File.readlines("hello-world.html")
  html_string.each { |line| connection.puts line }
  connection.close             # Close connection
end

