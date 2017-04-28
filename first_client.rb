require 'httparty'
include HTTParty

response = HTTParty.post('http://localhost:8080/query?q=foo')
puts response.body, response.code, response.message, response.headers.inspect
