# Viking Solution 2

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

      # Each loop starts here
      connection = server.accept

      # Initialize params
      params = {}

      # Get the first 1024 bytes from the request
      request_headers = connection.recvfrom(1024)

      # Get the HTTP request string
      request = request_headers.first

      # When a request is received we proceed logging the HTTP request
      puts "Request: #{request}"

      # Get request body
      # Find the length of the request body in the request headers
      matches = request_headers.join.match(/Content-Length: (\d+)/)

      # If there are matches we know it has POST data
      if matches

        # Get each line in an array
        lines = request_headers.first.split("\r\n")

        # If there is an empty line the next line is the data
        index = lines.index("")
        index += 1
        body = lines[index]

        # Parse the data into a hash
        body = body.split(' ')[0]
        body.split('&').each do |param|
          param = param.split('=')
          key = param[0]
          value = param[1]
          params[key] = value
        end
        puts "Body: #{body}"
        puts "Params: #{params}"
        puts ""
      else
        puts "No POST data"
      end

      # Get query string
      query = request.split('?')[1]
      if query
        query = query.split(' ')[0]
        query.split('&').each do |param|
          param = param.split('=')
          key = param[0]
          value = param[1]
          params[key] = value
        end
        puts "Query: #{query}"
        puts "Params: #{params}"
      end

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
