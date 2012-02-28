class User < ActiveRecord::Base
  has_many :create_plugins, :class_name => 'Plugin', :foreign_key => 'create_user_id'
  has_many :update_plugins, :class_name => 'Plugin', :foreign_key => 'update_user_id'
end
