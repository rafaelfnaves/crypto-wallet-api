class AddSymbolIdToCoin < ActiveRecord::Migration[7.0]
  def change
    add_column :coins, :symbol_id, :string
  end
end
