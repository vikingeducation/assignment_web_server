require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    request = connection.gets  # Read from connection    
    the_data = ""
   
    loop do 
    	inputline = connection.gets
    	break if inputline.length < 3
    	the_data = the_data + inputline
    end

    puts "We received a request that looked like #{request} and contained the following data:#{the_data}"
	
    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"
    File.open("index.html", 'r') do |html|  
  		while line = html.gets  
    		connection.puts line.chomp
  		end  
	end
    connection.close             # Close connection
end
