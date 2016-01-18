require 'open-uri'

def print
	open('http://localhost:8080/') do |f|
    f.each_line{ |line| puts line }
  end
end

p print