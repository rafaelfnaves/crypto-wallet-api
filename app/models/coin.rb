class Coin < ApplicationRecord
  def self.get_coins
    url = URI("https://rest.coinapi.io/v1/assets")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["X-CoinAPI-Key"] = ENV['API_KEY']
    response = http.request(request)
    
    return hash = JSON.parse(response.body) if response.code == "200"
  end
  
end
