require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
file = File.open("/Users/JoeBernardi/VCS/Ruby/assignment_web_server/web_page.txt", 'r' )

loop do
    connection = server.accept   # Open connection


    inputline = connection.gets  # Read from connection

    file.readlines.each do | l |

    	connection.puts l

    end


    	# Write into connection
    connection.close             # Close connection
end