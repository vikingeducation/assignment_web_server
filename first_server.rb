require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)

loop do
    connection = server.accept

    inputline = connection.gets

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    connection.puts( File.read('web_page.html') )

    connection.puts "We received a request that looks like #{connection.gets}"

    connection.close
end