require 'octokit'

class RepoProvider::Github

  URL_PATTERNS = [
    /git@github.com:(?<user>[^\/]+)\/(?<repo>.+)\.git/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

  def issues_list opts = {}
    # get issues for this repo
    if not opts[:all]
      issues = github.issues "#{repo['user']}/#{repo['repo']}"
    else
      issues = github.issues "#{repo['user']}/#{repo['repo']}"
    end
    # return issues
    format_issues( issues )
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

  def format_issues is
    Array(is).map do |i|
      # nothing yet...
      i
    end
  end

  def github
    init_github if @github.nil?
    @github
  end

  def init_github
    ot = oauth_token
    # get configuration from oauth token and secret
    if( not ot.nil? )
      @github = Octokit::Client.new oauth_token: ot
    else
      # use login and password otherwise
      @github = Octokit::Client.new login: user, password: password
    end
  end

end
