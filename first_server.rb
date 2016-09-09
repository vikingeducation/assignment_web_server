require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
#index = File.readlines("index.html")
loop do
	connection = server.accept
	inputline = connection.gets
	connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

	#line = server.gets
	test = connection.gets
    puts "We received a request that looked like #{ inputline } and contained the following data: #{ test }"
    #index.each {|x| puts connection.puts x}
	connection.close
end