class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :code
      t.integer :sponsor_id
      t.timestamps
    end
  end
end
