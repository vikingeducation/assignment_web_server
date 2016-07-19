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

# append = {question: "Will this work?"}

HTTParty.post("http://rubygems.org/api/v1/gems/httparty/owners",
              :query => { :email => "alan+thinkvitamin@carsonified.com" })
# puts Local.post("/get_stuff", append)

