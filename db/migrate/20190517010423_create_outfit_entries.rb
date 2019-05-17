class CreateOutfitEntries < ActiveRecord::Migration
  def change
    create_table :outfit_entries do |t|

      t.timestamps null: false
    end
  end
end
