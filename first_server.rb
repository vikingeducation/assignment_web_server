
require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"
    inputline = connection.gets  # Read from connection
    puts inputline
    file = File.readlines( "index.html") 
    file.each do |line|
      connection.puts line
    end

    connection.puts "Hello World"   # Write into connection
    connection.close             # Close connection
end