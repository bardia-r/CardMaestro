class AddApprovalStatusToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :approved, :boolean
  end
end
