require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    file = File.open("helloer_world.html", "r")
    text = file.read
    connection.puts text

    # connection.puts "Hello World"   # Write into connection
    connection.close
       # Close connection
end
