class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receiver
      t.string :contents
      t.datetime :sent_at
      t.boolean :seen

      t.timestamps
    end
  end
end
