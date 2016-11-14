require 'httparty'

response = HTTParty.get('http://localhost:8080', query: { foo: 'bar' } )
post_request = HTTParty.post('http://localhost:8080', query: { foo: 'bar' } )

p post_request
