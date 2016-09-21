require 'socket'

server = TCPServer.new("0.0.0.0", 8080)

file = File.readlines('helloer_worlder.html')
loop do
  connection = server.accept
  inputline = connection.gets

  connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

  connection.puts file
  connection.close
end