class RemoveTagListFromPairs < ActiveRecord::Migration[5.2]
  def change
    remove_column :pairs, :tag_list, :text
  end
end
