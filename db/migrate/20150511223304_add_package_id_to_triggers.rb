class AddPackageIdToTriggers < ActiveRecord::Migration
  def change
    add_column :triggers, :package_id, :integer
  end
end
