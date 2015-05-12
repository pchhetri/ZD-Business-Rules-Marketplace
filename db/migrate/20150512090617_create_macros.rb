class CreateMacros < ActiveRecord::Migration
  def change
    create_table :macros do |t|
      t.string :name
      t.string :tags
      t.string :description
      t.json :json
      t.integer :package_id

      t.timestamps null: false
    end
  end
end
