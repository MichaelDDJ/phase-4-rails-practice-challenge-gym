class AddUniqueIndexToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_index :memberships, [:client_id, :gym_id], unique: true
  end
end
