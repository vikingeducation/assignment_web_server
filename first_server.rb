require 'socket'
require 'httparty'

server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept
  inputline = connection.gets

  # connection.puts "Hello World"
  # connection.print "HTTP/1.1 302 Found\r\n" +
  #          "Content-Type: text/plain\r\n" +
  #          "Connection: close\r\n\r\n"
  file = File.open("hello.html")
  file.each do |line|
    connection.puts line
  end
  connection.close
end