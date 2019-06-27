module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo, html_options = {})
    link_to(repo, "https://github.com/#{author}/#{repo}", html_options)
  end
end
