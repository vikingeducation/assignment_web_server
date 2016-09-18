require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)

loop do
    connection = server.accept   # Open connection


    inputline = connection.gets  # Read from connection

    connection.puts( File.read('web_page.html') )

    	# Write into connection
    connection.close             # Close connection
end