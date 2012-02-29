class Plugin < ActiveRecord::Base
  validates :name, :uniqueness => true, :presence => true

  belongs_to :create_user, :class_name => 'User', :foreign_key => 'create_user_id'
  belongs_to :update_user, :class_name => 'User', :foreign_key => 'update_user_id'

  acts_as_paranoid

  def self.find(*args)
    if args.first && args.first.is_a?(String) && !args.first.match(/^\d*$/)
      project = find_by_name(*args)
      raise ActiveRecord::RecordNotFound, "Couldn't find Project with identifier=#{args.first}" if project.nil?
      project
    else
      super
    end
  end
end
