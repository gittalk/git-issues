require 'gitlab'

class RepoProvider::Gitlab

  URL_PATTERNS = [
    /git@(?<host>[^:]*):(?<user>[^\/]+)\/(?<repo>.+)\.git/
  ]

  def self.get_repo url
    # find the url pattern that matches the url
    URL_PATTERNS.map{|p| p.match url }.compact.first
  end

  def issues_list opts = {}
    log.error "Not yet implemented"
    # return issues
    format_issues( issues )
  end

  def issue_create title, content
    log.error "Not yet implemented"
  end

  def issue_delete id
    log.error "Not yet implemented"
  end

  private

  def gl_project_id
    path = "#{repo['user']}/#{repo['repo']}"
    p = gitlab.projects.find{|p| p.path_with_namespace == path}
    log.info "using project #{p.id} -- #{p.path_with_namespace}" if not p.nil?
    (p.nil?) ? nil : p.id
  end

  def format_issues is
    Array(is).map do |i|
      # nothing yet...
      i
    end
  end

  def gitlab
    init_gitlab if @gitlab.nil?
    @gitlab
  end

  def init_gitlab
    ot = oauth_token
    @gitlab = Gitlab.client endpoint: "http://#{repo['host']}/api/v3", private_token: ot
  end

end
