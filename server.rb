require 'socket'
require 'erb'

begin
  host = 'localhost'
  port = 3000
  puts "TCP Server listening at http://#{host}:#{port}"
  puts "Shut down with Crtl-C"
  server = TCPServer.new(host, port)
  path = "#{File.dirname(__FILE__)}/index.html.erb"
  file = File.read(path)
  loop do
    connection = server.accept
    input = connection.gets.strip
    instance_variable_set(:@input, input)
    output = ERB.new(file).result(binding)
    connection.print [
      "HTTP/1.1 200 OK\r\n",
      "Content-Type: text/html\r\n",
      "Connection: close\r\n\r\n"
    ].join
    connection.puts(output)
    connection.close
  end
rescue SystemExit, Interrupt
  puts "\n"
  puts "Goodbye!"
end



