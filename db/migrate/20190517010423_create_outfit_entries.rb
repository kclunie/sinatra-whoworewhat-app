class CreateOutfitEntries < ActiveRecord::Migration
  def change
    create_table :outfit_entries do |t|
      t.string :content 
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
