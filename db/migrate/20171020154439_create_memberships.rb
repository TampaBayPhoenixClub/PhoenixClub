class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.datetime :join_date
      t.datetime :renewal_date
      t.string   :status
      t.timestamps
    end
  end
end
