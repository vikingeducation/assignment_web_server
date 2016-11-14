require 'open-uri'

open('http://localhost:8080') do |f|
    f.each_line{ |line| puts line }
end