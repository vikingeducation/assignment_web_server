require 'socket'
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept
  inputline = connection.gets
  connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"
  file = File.read('hello.html').split("\n")
  file.each do |line|
    connection.puts line
  end

  connection.puts "Hello World"
  connection.close
end
