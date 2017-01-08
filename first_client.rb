require 'open-uri'

puts "\nSend the simplest Get request\n"

open('http://localhost:8080', "From" => "akbar agha",) do |f|
    f.each_line{ |line| puts line }
end

puts "\nFinish of the simplest get request\n"

#puts "\nSend the simplest Get request\n"

#open('http://localhost:8080', :proxy => nil) do |f|
#    f.each_line{ |line| puts line }
#end

#puts "\nFinish of the simplest get request\n"
