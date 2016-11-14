require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    file = File.open("helloer_world.html", "r")
    text = file.read


    connection.puts "Helloer World"
    connection.puts "Hello World"   # Write into connection
    connection.close        
    file.close
       # Close connection
end