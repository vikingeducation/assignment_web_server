require 'httparty'

response = HTTParty.get('http://localhost:8080', query: { foo: 'bar' } )

p response
