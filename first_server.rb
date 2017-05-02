require 'socket'

server = TCPServer.new("0.0.0.0", 8080)

loop do 
	connection = server.accept
	inputline = connection.gets
	connection.print "HTTP/1.1 200 OK\r\n" +
									 "Content-Type: text/plain\r\n" +
									 "Connection: close\r\n\r\n"

	html = File.readlines("index.html")
	html.each do |line|
		puts line
	end

	connection.puts "Hello World"
	
	connection.close
end