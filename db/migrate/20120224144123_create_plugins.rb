class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :url
      t.string :desription
      t.string :formula
      t.integer :create_user_id
      t.integer :update_user_id

      t.timestamps
    end
  end
end
