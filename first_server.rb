require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
    connection = server.accept   # Open connection
    
    inputline = connection.gets  # Read first line of the request
    STDERR.puts inputline  # log the request to console for debugging

    response = ''
    File.open('./test.html').each_line do |line|
      response += line
    end
    response += "\n"

    # We need to include the Content-Type and Content-Length headers
    # to let the client know the size and type of data
    # contained in the response. Note that HTTP is whitespace
    # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
    connection.print "HTTP/1.1 200 OK\r\n" +
                      "Content-Type: text/plain\r\n" +
                      "Content-Length: #{response.bytesize}\r\n" +
                      "Connection: close\r\n\r\n"

    connection.print response
    connection.close             # Close connection
end

# http://practicingruby.com/articles/implementing-an-http-file-server