class AddPrivateToCardOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_column :card_ownerships, :private, :boolean
  end
end
