class CreateCardConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :card_conditions do |t|
      t.references :card_ownership, null: false, foreign_key: true
      t.integer :near_mint
      t.integer :moderately_played
      t.integer :damaged
      t.integer :signed
      t.integer :premium

      t.timestamps
    end
  end
end
