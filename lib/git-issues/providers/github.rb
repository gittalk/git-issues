class RepoProvider::Github

  URL_PATTERNS = [
    /git@github.com:(?<user>[^\/]+)\/(?<repo>.+)\.git/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

  def issues_list opts = {}
    require 'pry'
    binding.pry
    # get issues for this repo
    if not opts[:all]
      issues = github.issues.list 'arlimus', 'git-issues', state: 'open'
    else
      issues = github.issues.list 'arlimus', 'git-issues'
    end
    # return issues
    issues.body
  end

  def issue_create title, content
    github.issues.create( repo['user'], repo['repo'], {
      title:    title,
      content:  content
      })
  end

  def issue_delete id
    github.issues.delete( repo['user'], repo['repo'], id)
  end

  private

  def github
    init_github if @github.nil?
    @github
  end

  def init_github
    require 'github_api'
    ot = oauth_token
    # get configuration from oauth token and secret
    if( not ot.nil? )
      @github = Github.new oauth_token: ot
    else
      # use login and password otherwise
      @github = Github.new login: user, password: password
    end
  end

end
