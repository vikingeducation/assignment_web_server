require 'socket'
# IP address is 0.0.0.0 and it's on port 8080
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept #open connection
  inputline = connection.gets #read from connection
  puts inputline
  arr = "We received a request that looked like #{inputline} and contained the following data: #{} "

  connection.print "HTTP/1.1 200 OK\r\n" +
                              "Content-Type: text/plain\r\n" +
                              "Connection: close\r\n\r\n"
  connection.puts arr # write into connection
  connection.close #close connection

end
