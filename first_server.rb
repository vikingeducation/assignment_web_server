# first_server.rb
require 'socket'
require 'httparty'

# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept   # Open connection
  inputline = connection.gets  # Read from connection
  connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: NOT TEXT/plain\r\n" +
           "Connection: close\r\n\r\n"
  response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

  connection.puts response.body
  #html_string = File.readlines("hello-world.html")
  #html_string.each { |line| connection.puts line }
  connection.close             # Close connection
end

