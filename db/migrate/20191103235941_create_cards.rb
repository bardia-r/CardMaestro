class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :text
      t.string :collection
      t.string :set

      t.timestamps
    end
  end
end
