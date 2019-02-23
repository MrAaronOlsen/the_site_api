class CreateCurrentVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :current_versions do |t|
      t.integer :version
      t.string :model

      t.timestamps
    end
  end
end
