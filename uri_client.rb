# uri client 

# Open URI is another Ruby standard library
#   which only supports GET requests

require 'open-uri'

open('http://localhost:8080') do |f|
  f.each_line{|line| pits line}
end








