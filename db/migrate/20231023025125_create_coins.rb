class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :asset_id
      t.date :data_start
      t.date :data_end
      t.float :price

      t.timestamps
    end
  end
end
