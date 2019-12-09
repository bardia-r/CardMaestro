class AddImageurlToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :imageurl, :string
  end
end
