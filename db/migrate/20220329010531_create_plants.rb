class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.bigint :user_id, null: false
      t.string :name, null: false
      t.string :api_key, null: false
      t.datetime :deleted_at, precision: 6
      t.timestamps
    end
    add_index :plants, :deleted_at
  end
end