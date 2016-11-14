require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept   # Open connection
  inputline = connection.gets  # Read from connection
  puts inputline
  data_array = inputline.split(' ')
  p "We received a request that looked like #{inputline.strip} and contained the following data: #{data_array[1]}"
  connection.print "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/html\r\n" +
    "Connection: close\r\n\r\n"
  page = File.readlines('index.html')
  connection.puts page   # Write into connection
  connection.close             # Close connection
end
