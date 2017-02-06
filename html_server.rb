# first server 

require 'socket'
#IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

        connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"



    #HTTP Request
    open("HTML_h1.html") {|f|
      f.each_line {|line| connection.puts line} 
        # Write into connection"
    }

#    connection.puts "Hello World"   # Write into connection"
    connection.close             # Close connection
end


