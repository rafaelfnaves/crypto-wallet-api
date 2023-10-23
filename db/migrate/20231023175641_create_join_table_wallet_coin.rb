class CreateJoinTableWalletCoin < ActiveRecord::Migration[7.0]
  def change
    create_join_table :wallets, :coins do |t|
      # t.index [:wallet_id, :coin_id]
      # t.index [:coin_id, :wallet_id]
    end
  end
end
