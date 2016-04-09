require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
html = File.read("page.html")

loop do
  connection = server.accept
  inputline = connection.gets

  connection.print "HTTP/1.1 200 OK\r\n" +
                   "Content_Type: text/plain\r\n" +
                   "Connection : close\r\n\r\n"

  output = connection.puts html

  connection.print "We received a request that looked like #{inputline} and contained the following data: #{output}"
  connection.close

end