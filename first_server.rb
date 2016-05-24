require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept
  inputline = connection.gets

  connection puts "Hello World!"
  connection.close
end
