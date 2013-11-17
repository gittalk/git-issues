class RepoProvider::Bitbucket
  URL_PATTERNS = [
    /git@bitbucket.org:(?<user>[^\/]+)\/(?<repo>.+)\.git/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

end
