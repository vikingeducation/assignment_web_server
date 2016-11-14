require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection
    input_array = inputline.split(" ")

    page = File.read("./html_page.html")

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/html\r\n" +
           "Connection: close\r\n\r\n"

  
    connection.puts "You issued a  #{input_array[0]} request."

    connection.puts "The path request was #{input_array[1]}"

    connection.puts "The protocol you are using is #{input_array[2]}"

    # page.each do |line|   # Write into connection
    #   puts line 
    #   connection.puts line
    # end

    connection.close             # Close connection
end