class Coin < ApplicationRecord
  has_and_belongs_to_many :wallets

  paginates_per 15

  def self.get_coins
    url = URI("https://rest.coinapi.io/v1/symbols/bitstamp?filter_asset_id=USD")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["X-CoinAPI-Key"] = ENV['API_KEY']
    response = http.request(request)
    
    return hash = JSON.parse(response.body) if response.code == "200"
  end

  def self.get_periods(coin, period)
    url = URI("https://rest.coinapi.io/v1/ohlcv/BITSTAMP_SPOT_#{coin}_USD/latest?period_id=#{period}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["X-CoinAPI-Key"] = ENV['API_KEY']
    response = http.request(request)
    data = JSON.parse(response.body)
    # coinPrices = data.pluck('price_close')
    
    # previous = coinPrices[-2]
    # current = coinPrices[-1]
    # percent_change = (current - previous) / previous * 100
    # percent_format = sprintf("%.2f%%", percent_change)
    
    # # Update coin
    # coin.update_column(:previous, )
    # coin.update_column(:current, )
    # coin.update_column(:percent, percent_format)
  end
end