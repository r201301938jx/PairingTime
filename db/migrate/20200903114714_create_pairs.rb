class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.string :image_id, null: false
      t.text :caption
      t.text :tag_list

      t.timestamps
    end
  end
end
