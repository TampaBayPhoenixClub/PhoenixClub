class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string    :first_name
      t.string    :last_name
      t.datetime  :birthday
      t.string    :scene_name
      t.datetime  :join_date
      t.datetime  :renewal_date
      t.string    :status
      t.integer   :membership_id
      t.text      :notes
      t.timestamps
    end
  end
end
