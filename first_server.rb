require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/html\r\n" +
           "Connection: close\r\n\r\n"
    connection.puts "Hello World"   # Write into connection

    puts inputline
    html_lines = File.readlines("index.html")
    html_lines.each do |line|
      connection.puts line
    end

    connection.close             # Close connection
end