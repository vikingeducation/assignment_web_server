# Viking Solution 1

require 'socket'

host = 'localhost'
port = 8080

# Create server
server = TCPServer.new(host, port)

# Output helpful logging info to command-line on server startup
puts "TCP Server listening at http://#{host}:#{port}"
puts "Shut down with Ctrl-C"

# Store the absolute path to the root directory in a constant
ABSPATH = File.expand_path(File.dirname(__FILE__))

# Get the output HTML file as a string
file = File.read("#{ABSPATH}/index.html")

# Open up a begin/rescue block to allow quiting by CTRL+C
begin
  # We're now serving loop forever!
  loop do
      # Open connection
      connection = server.accept

      # Waits here for a request
      request = connection.gets

      # When a request is received, we proceed logging the HTTP request
      puts "Request: #{request}"

      # Loading the response HTML
      response = file

      # Set our HTTP reponse headers
      response_headers = [
        "HTTP/1.1 200 OK\r\n",
        "Content-Type: text/html\r\n",
        "Connection: close\r\n\r\n"
      ].join

      # Print the response headers
      connection.print(response_headers)

      # Output the HTML
      connection.puts(response)

      # Close the connection
      connection.close

      # Separate logging requests by a newline
      puts ""
  end

# Rescue CTRL+C interrupt and output shutdown to terminal
rescue SystemExit, Interrupt
  puts "\n"
  puts "Shutting down server"
end
