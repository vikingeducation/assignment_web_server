# Open URI is another Ruby standard library
#   which only supports GET requests
require 'open-uri'
require 'httparty'
open('http://localhost:8080') do |f|
    f.each_line{ |line| puts line }
end

#Get
response = HTTParty.get('http://localhost:8080')
puts response.body, response.code, response.message, response.headers.inspect

#Post
post_response = HTTParty.post('http://localhost:8080')
puts post_response.body, post_response.code, post_response.message, post_response.headers.inspect

#Get with params
opts = {query: {param1: "hello", param2: "world"}}
response = HTTParty.get('http://localhost:8080', opts)
puts response.body, response.code, response.message, response.headers.inspect

#Post with params
opts = {query: {param1: "hello", param2: "world"}}
response = HTTParty.post('http://localhost:8080', opts)
puts response.body, response.code, response.message, response.headers.inspect
