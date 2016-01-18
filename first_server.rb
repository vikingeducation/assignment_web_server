require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection
    puts inputline # prints the HTML request type

    # HTTP response header
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    input_file = File.open("index.html").readlines.map(&:strip)
    input_file.each do |line|
      connection.puts line
    end

    #connection.puts "Hello World"   # Write into connection
    #connection.puts "#{params[:p]}"
    connection.close             # Close connection
end
