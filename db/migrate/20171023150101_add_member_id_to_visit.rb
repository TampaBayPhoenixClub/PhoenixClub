class AddMemberIdToVisit < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :member_id, :integer
  end
end
