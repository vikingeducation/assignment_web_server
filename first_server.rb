require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
output = File.read("index.html")

loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection


    connection.puts output   # Write into connection
    connection.close             # Close connection
end
