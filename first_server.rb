require 'pry'
require 'socket'
require 'cgi'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    inputline = connection.gets  # Read from connection
    parms_str = inputline.match(/\?(.*?) /) ? inputline.match(/\?(.*?) /)[1] : nil

    puts "We received a request that looked like"
    puts inputline
    puts "contained the following data"
    p CGI::parse(parms_str) if !parms_str.nil?
    puts "================"

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"
    File.readlines("index.html").each do |line|
      connection.puts line
    end
    connection.close             # Close connection
end