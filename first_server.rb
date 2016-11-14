require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
loop do
  client = server.accept       # Wait for a client to connect
  method, path = client.gets.split                    # In this case, method = "POST" and path = "/"
  headers = {}
  while line = client.gets.split(' ', 2)              # Collect HTTP headers
    break if line[0] == ""                            # Blank line means no more headers
    headers[line[0].chop] = line[1].strip             # Hash headers by type
  end
  data = client.read(headers["Content-Length"].to_i)  # Read the POST data as specified in the header

  puts data 
  # connection.puts "Hello World"
  # connection.print "HTTP/1.1 302 Found\r\n" +
  #          "Content-Type: text/plain\r\n" +
  #          "Connection: close\r\n\r\n"
  file = File.open("hello.html")
  file.each do |line|
    client.puts line
  end
  client.puts data
  client.close

end