module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo, html_options = {})
    link_to(repo, "https://github.com/#{author}/#{repo}", html_options)
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, class: "alert alert-#{key}"
    end.join.html_safe
  end

end
