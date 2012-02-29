class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :formula
      t.integer :create_user_id
      t.integer :update_user_id
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
