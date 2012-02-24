class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :url
      t.string :desription
      t.integer :formula
      t.integer :user_id

      t.timestamps
    end
  end
end
