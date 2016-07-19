
require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    # inputline = connection.gets #|| connection.post  # Read from connection
    input = connection.recvfrom(1024)
    # postline = connection.post
    connection.print "HTTP/1.1 200 OK\r\n" +
            "Content-Type: text/plain\r\n" +
            "Connection: close\r\n\r\n"
    # connection.print "We received a request that looked like #{ inputline } and contained the following data: #{inputline.body}"
    puts input
    file = File.readlines("hello.html")

     file.each do |line|
       connection.puts line
     end

    connection.puts "Hello World"   # Write into connection
    # connection.puts inputline
    connection.close             # Close connection
end



# "HTTP/1.1 200 OK\r\n" +
#            "Content-Type: text/plain\r\n" +
#            "Connection: close\r\n\r\n"
