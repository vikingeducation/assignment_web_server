require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
host = 'localhost'
port = 8080

server = TCPServer.new(host, port)
puts "Listening at http://#{host}:#{port}","Ctrl+C to quit"


loop do
    # Open connection
    connection = server.accept

    # Read from connection & output to console
    inputline = connection.gets
    puts inputline

    # Response header
    connection.print("HTTP/1.1 200 OK\r\n" +
                     "Content-Type: text/html\r\n" +
                     "Connection: close\r\n\r\n")

    # Open the file that will be rendered
    file = File.readlines("index.html")

    # Write into connection
    connection.puts file

    # Close connection
    connection.close
  end

