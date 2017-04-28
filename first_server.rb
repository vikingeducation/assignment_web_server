require 'socket'

server = TCPServer.new('127.0.0.1', 8080)

# read in test file
filename = './helloer_worlder.html'
lines = File.readlines(filename)

loop do
  connection = server.accept  # open connection
  inputline = connection.gets # read from connection

  # see what client sent in the connection
  puts "We received a request that looked like: #{inputline}"

  # send HTTP 200 response header
  connection.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/plain\r\n" +
                   "Connection: close\r\n\r\n"

  # send contents of our file
  lines.each { |line| connection.puts line }

  connection.close  # close connection
end
