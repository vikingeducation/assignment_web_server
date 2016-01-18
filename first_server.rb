require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
file = File.read('helloer_worlder.html')

loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    #http response header
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"
     output = connection.puts file

     connection.print "We received a request that looked like #{inputline} and contained the following data: #{output}" 

   
    #connection.puts "Hello World"   # Write into connection
    connection.close             # Close connection
end