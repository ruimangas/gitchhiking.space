require 'github/github_api'

class StarredRepos
  attr_accessor :nickname, :github, :start_date

  def initialize(nickname, start_date)
    @nickname = nickname
    @github = GitHubApi.new
    @start_date = start_date ||= one_week_ago
  end

  def starred_repos
    response = github.get(base_path)
    last_page = pagination_size(response.headers)
    current_page = 1
    fetched_repos = []

    while current_page <= last_page
      repos = github.get(path(current_page))

      if check_next_page?(response)
        fetched_repos << repos
      else
        fetched_repos << recently_starred(repos)
        break
      end

      current_page += 1
    end

    return fetched_repos
  end

  private

  # check next page if all current page's repos are newer than the specified time interval
  def check_next_page?(current_page_repos)
    starred_dates = current_page_repos.map { |repo| repo.fetch('starred_at') }

    starred_dates.all? do |date|
      date >= start_date
    end
  end

  def recently_starred(repos)
    repos.select do |repo|
      repo.fetch('starred_at') >= start_date
    end
  end

  # returns how many pages the response has
  def pagination_size(headers)
    links = headers.fetch('link') \
            .scan(/<(.*?)>/).flatten

    links.last.split('=').last.to_i
  end

  def one_week_ago
    1.week.ago
  end

  def path(page_num)
    "#{base_path}?page=#{page_num}"
  end

  def base_path
    "https://api.github.com/users/#{nickname}/starred"
  end
end
