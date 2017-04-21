require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    output = File.readlines("index.html")
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/html\r\n" +
           "Connection: close\r\n\r\n"
    output.each do |line|
      connection.puts line
    end
    connection.puts inputline
#    connection.puts "Hello World"   # Write into connection
    connection.close             # Close connection
end
