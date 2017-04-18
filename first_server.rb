require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)

loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection arr = []

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    html_string = File.read("test.html")
    heading_message = html_string.scan(/<h1>(.+)<\/h1>/).join

    connection.print "We received a request that looked like #{ inputline } and contained the following data: #{ heading_message} \r\n"


    connection.puts "Hello World"   # Write into connection
    connection.puts "#{heading_message}"

    connection.close             # Close connection
end
