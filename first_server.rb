require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection
    while line = connection.gets
      connection.puts line
    end
    connection.print "HTTP/1.1 200 OK\r\n" +
      "Content-Type: text/html\r\n" +
      "Connection: close\r\n\r\n"

    connection.puts File.open("page.html", "r").readlines
    connection.puts "We received a request that looked like #{inputline} with data"
    connection.close             # Close connection
end