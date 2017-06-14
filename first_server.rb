require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept
  request_info = ""
  while inputline = connection.gets
    request_info += inputline
    break if inputline == "\r\n"
  end

  connection.print "HTTP/1.1 200 OK\r\n" +
  "Content-Type: text/html\r\n" +
  "Connection: close\r\n\r\n"

  connection.puts File.readlines('html_page.html')
  connection.puts "We received request #{request_info}"
  connection.close
end
