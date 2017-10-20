require 'socket'

server = TCPServer.new("0.0.0.0", 8080)
begin

  loop do
    connection = server.accept
    inputline = connection.gets
    parameter = inputline.split("?")[1]

    params = {}

    if parameter
      parameter = query.spli(" ")[0]
      parameter.split("&").each do |param|
        param = param.split("=")
        key = param[0]
        value = param[1]
        params[key] = value
      end
    end


    connection.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Connection: close\r\n\r\n"

    connection.print "We received a request that looked like #{ inputline } and contained the following data: query: #{parameter} and params: #{ params} \n"

    connection.puts "Hello World"
    connection.puts File.read("test.html")
    connection.close

  end

rescue SystemExit, Interrupt
  puts "\n"
  puts "Goodbye!"
end
