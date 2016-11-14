require 'httparty'

# give me the response info for this URL
# response = HTTParty.get('http://localhost:8080')

# here is the response info
# puts response.body, response.code, response.message, response.headers.inspect 

response = HTTParty.post('http://localhost:8080', body: { bar: 'baz' } )

puts response.body, response.code, response.message, response.headers.inspect 