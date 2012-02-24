class Setting
  begin
    @@available_settings = YAML.load(File.open("#{Rails.root}/config/settings.yml"))
  rescue
    @@available_settings = {}
  end

  def self.[](key)
    @@available_settings[key.to_s] || ENV[key.to_s]
  end
end
