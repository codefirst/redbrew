class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_name
      t.string :icon_url

      t.timestamps
    end
  end
end
