require 'octokit'

# API documentation:
# http://developer.github.com/v3/

class RepoProvider::Github

  URL_PATTERNS = [
    /^(ssh:\/\/)?git@github.com:(?<user>[^\/]+)\/(?<repo>.+)\.git$/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

  def issues_list opts = {}
    # get open issues for this repo
    issues = github.issues gh_repo
    # get all closed issues if required
    issues += github.issues( gh_repo, state: 'closed' ) if opts[:all]
    # return issues
    format_issues( issues )
  end

  def issue_create title, content
    ret = github.create_issue gh_repo, title, content
    ret.attrs && ret.attrs[:number] || -1
  end

  def issue_close id
    ret = github.close_issue gh_repo, id
    ret[:state] == 'closed'
  end

  def issue_delete id
    log.warn "You can't delete issues on GitHub. Please close/resolve them instead."
  end

  def provider
    github
  end

  private

  def gh_repo
    "#{repo['user']}/#{repo['repo']}"
  end

  def format_issues is
    Array(is).map do |i|
      i['description'] = i['body']
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
      @github = Octokit::Client.new access_token: ot
    else
      # use login and password otherwise
      @github = Octokit::Client.new login: user, password: password
    end
  end

end
