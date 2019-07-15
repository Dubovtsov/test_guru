module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo, html_options = {})
    link_to(repo, "https://github.com/#{author}/#{repo}", html_options)
  end

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'alert alert-danger'
    end
  end
end
