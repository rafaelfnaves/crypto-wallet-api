class AddIconIdToCoin < ActiveRecord::Migration[7.0]
  def change
    add_column :coins, :icon_id, :string
  end
end
