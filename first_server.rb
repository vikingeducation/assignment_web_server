require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection

    page = File.readlines("./html_page.html", "r")

    page.each do |line|   # Write into connection
      connection.puts line
    end

    connection.close             # Close connection
end