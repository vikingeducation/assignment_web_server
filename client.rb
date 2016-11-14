require 'httparty'

p HTTParty.post('http://0.0.0.0:8080', {
  body: {text: 'test'}.to_json
  })

# open('http://localhost:8080', our_hash) do |f|
#   f.each_line {|line| puts line}
# end
