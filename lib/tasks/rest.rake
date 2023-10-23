namespace :rest do
  desc 'Search on CoinAPI and save data'
  task create_coins: :environment do
    coins = Coin.get_coins
    for coin in coins do
      unless coin["type_is_crypto"] == 0
        Coin.create!(
          name: coin["name"],
          asset_id: coin["asset_id"],
          data_start: coin["data_start"],
          data_end: coin["data_end"],
          price: coin["price_usd"],
          type_is_crypto: true
        )
      end
    end
  end

  desc 'Update coins in db'
  task update_coins: :environment do
    coins = Coin.get_coins
    for coin in coins do
      unless coin["type_is_crypto"] == 0
        coin_db = Coin.find_by_asset_id(coin["asset_id"])
        coin_db.update_column(:price, coin["price_usd"])
      end
    end
  end
end