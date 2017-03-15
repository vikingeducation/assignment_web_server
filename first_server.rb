require "socket"

def read_page(path)
  File.readlines(path).reduce("") do |acc, line|
    acc += line
  end
end

def print_response_header(connection)
  headers = "HTTP/1.1 200 OK\r\n" +
            "Content-Type: text/plain\r\n" +
            "Connection: close\r\n\r\n"
  connection.print headers
end

# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept # open connection
  inputline = connection.gets # read from connection
  print_response_header(connection)
  connection.puts read_page("page.html") # write into connection
  connection.close # close connection
end
