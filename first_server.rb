require 'socket'

server = TCPServer.new('127.0.0.1', 8080)

# read in test file
filename = './helloer_worlder.html'
lines = File.readlines(filename)

loop do
  connection = server.accept  # open connection
  inputline = connection.gets # read from connection

  puts inputline  # see what client sent in the connection

  # return contents of our file
  lines.each { |line| connection.puts line }

  connection.close  # close connection
end
