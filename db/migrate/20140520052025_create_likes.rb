class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.references :idea, :null => false
      t.references :user, :null => false
      t.boolean    :live, :null => false, :default  => true
      t.timestamps
    end

    add_index :likes, :idea_id
    add_index :likes, :user_id
    add_index :likes, [:idea_id, :user_id], :unique => true
  end
end
