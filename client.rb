# Open URI is another Ruby standard library
#   which only supports GET requests
require 'httparty'
infodata = open("http://localhost:8080",
  "User-Agent" => "Ruby/#{RUBY_VERSION}",
  "From" => "foo@bar.invalid",
  "Referer" => "http://www.ruby-lang.org/") do |f|
    f.each_line{ |line| puts line }
end
p infodata
