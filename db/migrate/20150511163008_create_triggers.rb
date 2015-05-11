class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
    	t.string "name"
    	t.string "description"
    	t.string "tags"
    	t.json "json"
      t.timestamps null: false
    end
  end
end
