class AddSellToCardOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_column :card_ownerships, :sell, :boolean
  end
end
