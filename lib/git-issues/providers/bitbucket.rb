require 'bitbucket_rest_api'

class RepoProvider::Bitbucket
  URL_PATTERNS = [
    /git@bitbucket.org:(?<user>[^\/]+)\/(?<repo>.+)\.git/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

  def issues_list opts = {}
    # get issues for this repo
    issues = bitbucket.issues.list_repo(repo['user'], repo['repo'])
    # filter closed issues if the user doesn't want all
    if not opts[:all]
      issues = issues.find_all{|i|
          'resolved' != i['status']
        }
    end
    # return issues
    issues
  end

  private

  def bitbucket
    init_bitbucket if @bitbucket.nil?
    @bitbucket
  end

  def init_bitbucket
    @bitbucket = BitBucket.new login: user, password: password
  end

end
