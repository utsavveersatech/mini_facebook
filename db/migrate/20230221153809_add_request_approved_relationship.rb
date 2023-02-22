class AddRequestApprovedRelationship < ActiveRecord::Migration[6.1]
  def change
    add_column :relationships, :request_approved, :boolean
  end
end
