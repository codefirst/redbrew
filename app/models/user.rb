class User < ActiveRecord::Base
  attr_accessible :id, :name, :github_name, :icon_url

  has_many :create_plugins, :class_name => 'Plugin', :foreign_key => 'create_user_id'
  has_many :update_plugins, :class_name => 'Plugin', :foreign_key => 'update_user_id'
end
