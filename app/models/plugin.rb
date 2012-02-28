class Plugin < ActiveRecord::Base
  belongs_to :create_user, :class_name => 'User', :foreign_key => 'create_user_id'
  belongs_to :update_user, :class_name => 'User', :foreign_key => 'update_user_id'
end
