require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new('localhost', 8080)
loop do
    # Open connection
    connection = server.accept

    # Read from connection
    inputline = connection.gets

    # Response header
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    connection.puts "We received a request that looked like #{ inputline } and contained the following data: #{ inputline }"

    # Close connection
    connection.puts 'Closing connection'
    connection.close
  end

