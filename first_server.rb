require 'socket'
# IP address is 0.0.0.0 and it's on port 8080
server = TCPServer.new("0.0.0.0", 8080)
ABSPATH = File.expand_path(File.dirname(__FILE__))

file = File.read("#{ABSPATH}/index.html")
begin
  loop do
    connection = server.accept #open connection
    inputline = connection.gets #read from connection
    puts inputline
    params = {}
    query = inputline.split('?')[1]
    if query
      query = query.split(' ')[0]
      query.split('&').each do |param|
        param = param.split('=')
        key = param[0]
        value = param[1]
        params[key] = value
      end
    end

    response = file
    response_headers = ["HTTP/1.1 200 OK\r\n", "Content-Type: text/html\r\n", "Connection :close\r\n\r\n"].join
    arr = "We received a request that looked like #{inputline} and contained the following data: #{} "

    connection.print(response_headers)
    connection.puts(response)
    connection.puts arr # write into connection
    connection.close #close connection
  end
rescue SystemExit, Interrupt
  puts "\n"
  puts "Ending server connection"
end
