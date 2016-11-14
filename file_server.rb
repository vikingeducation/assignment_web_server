require 'socket'

# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)

loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    connection.print "HTTP/1.1 200 OK\r\n" + # Response header
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    File.readlines('test.html').each do |line|
      connection.puts line
    end

    puts "We received the following request that looked like #{inputline.split('?')}"

    connection.close                # Close connection
end