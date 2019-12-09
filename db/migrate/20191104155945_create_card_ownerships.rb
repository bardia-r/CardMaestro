class CreateCardOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :card_ownerships do |t|
      t.integer :count
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
