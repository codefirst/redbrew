class AddDownloadsToPlugins < ActiveRecord::Migration
  def change
    add_column :plugins, :downloads, :integer

  end
end
