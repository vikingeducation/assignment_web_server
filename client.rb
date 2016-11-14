require 'open-uri'

open('http://localhost:8080',
  "Computer" => "Luke's Laptop") do |f|
    f.each_line{ |line| puts line }
end