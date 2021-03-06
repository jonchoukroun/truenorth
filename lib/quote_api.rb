require 'httparty'

module QuoteAPI
  API_URL = "https://api.github.com/zen"

  # Basic auth attempt with env variables
  def authorize
    @auth = {
     "username" => ENV["GITHUB_USER"],
     "password" => ENV["GITHUB_PASS"] 
    }
  end

  # Hard coded quote in case of rate limit
  def self.standard_quote
    return "Always shut the door on your way out."
  end

  # Call github api for random quote
  def self.api_quote
    HTTParty.get(API_URL,
        headers: @auth
      )
  end

  def self.get_quote
    return api_quote ? api_quote : standard_quote
  end
end