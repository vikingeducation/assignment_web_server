require 'open-uri'

open('http://localhost:8080/html_page?id=1&name=bob') do |f|
    f.each_line{ |line| puts line }
end

