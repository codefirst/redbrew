class Plugin < ActiveRecord::Base
  attr_accessible :id, :name, :url, :description, :formula, :create_user_id, :update_user_id, :deleted_at, :plugins, :downloads

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

  def self.search_by_keywords(keywords)
    plugins = Arel::Table.new :plugins
    conds = keywords.strip.split.map do |key|
      [:url, :description, :formula].inject (plugins[:name].matches("%#{key}%")) do |condition, col|
        condition.or(plugins[col].matches("%#{key}%"))
      end
    end

    conds.inject (Plugin) {|query, cond| query.where(cond) }
  end
end
