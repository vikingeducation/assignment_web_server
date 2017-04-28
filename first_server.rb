require 'socket'

server = TCPServer.new('127.0.0.1', 8080)

loop do
  connection = server.accept  # open connection
  inputline = connection.gets # read from connection

  puts inputline  # see what client sent in the connection

  connection.puts "Hello World!"  # write into connection
  connection.close  # close connection
end
