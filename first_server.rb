require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
begin

  loop do
    connection = server.accept
    inputline = connection.gets
    read = File.read("test.html")
    parameter = inputline.split

    connection.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Connection: close\r\n\r\n"

    connection.print "We received a request that looked like #{ inputline } and contained the following data: #{ parameter[1]} \n"

    connection.puts "Hello World"
    connection.puts File.read("test.html")
    connection.close

  end

rescue SystemExit, Interrupt
  puts "\n"
  puts "Goodbye!"
end
