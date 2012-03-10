module UsersHelper
  def link_to_github(user)
    html = image_tag(user.icon_url, :width => '16px')
    html << link_to(user.name, "https://github.com/#{user.github_name}")
    html
  end
end
