# google.rb

require 'httparty'

class Google
  include HTTParty

  base_uri 'google.com'

  def initialize(search_string)
    @options = { query: {q: search_string} }
  end

  def questions
    self.class.get("", @options)
  end
end

#google = Google.new("Viking Code School")
#puts google.questions



class Local
  include HTTParty

  base_uri "http://localhost:8080"
end

append = {question: "Will this work?"}

puts Local.post("/",append)
