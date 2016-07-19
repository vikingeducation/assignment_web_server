require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection


    connection.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Connection: close\r\n\r\n"

    File.readlines("index.html").each do |line|
      connection.puts line
    end



    connection.puts "We received a request that looked like #{ inputline }"
    connection.puts "Hello World"   # Write into connection
    connection.puts "This is a test"
    connection.puts "#{inputline.inspect}"
    connection.close             # Close connection
end
