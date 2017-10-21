class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :scene_name
      t.timestamps
    end
  end
end
