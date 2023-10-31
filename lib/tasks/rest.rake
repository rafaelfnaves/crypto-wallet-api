namespace :rest do
  desc 'Search on CoinAPI and save data'
  task create_coins: :environment do
    coins = Coin.get_coins
    for coin in coins do
      Coin.create!(
        name: coin["asset_id_base_exchange"],
        asset_id: coin["asset_id_base"],
        data_start: coin["data_start"],
        data_end: coin["data_end"],
        price: coin["price"]
      )
    end
  end

  desc 'Update coins in db'
  task update_coins: :environment do
    coins = Coin.get_coins
    for coin in coins do
      coin_db = Coin.find_by_asset_id(coin["asset_id_base"])
      coin_db.update_column(:price, coin["price"])
    end
  end
end