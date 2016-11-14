require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    p inputline
    p connection

    connection.puts "We received a request that looked like #{ inputline } and contained the following data:"

    File.readlines('./test.html').each do |line|
      connection.puts line
    end

    connection.close             # Close connection
end
