require 'httparty'
require 'json'

class GitHubApi
  include HTTParty

  def get(path)
    self.class.get(path, headers: header)
  end

  private

  def header
    {
      'Accept' => 'application/vnd.github.v3.star+json',
      'User-Agent' => 'stars-reminder'
    }
  end
end
