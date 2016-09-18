require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
text = "Hello There"

loop do
    connection = server.accept

    inputline = connection.gets

    connection.puts(text)

    connection.print "HTTP/1.1 200 OK\r\n" +
           "Content-Type: text/plain\r\n" +
           "Connection: close\r\n\r\n"

    File.open('web_page.html', "r").each do | l |

    	connection.puts l

    end


    puts "We received gets #{inputline} at #{connection.gets}"

    connection.puts( "We received gets #{inputline} at #{connection.gets}" )

    connection.close
end