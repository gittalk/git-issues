require 'parseconfig'
require 'zlog'

class GitIssues
  def version; '0.0' end
  Log = Logging.logger[self]

  GIT_URLS = {
    bitbucket: [
      /git@bitbucket.org:(?<user>[^\/]+)\/(?<repo>.+)\.git/
    ]
  }

  def gitReposFor path, type = nil
    p = File::expand_path(path)
    git_path = File::join(p, '.git')
    git_conf = File::join(git_path, 'config')

    if not File::directory?(git_path)
      Log.error "This is not a git repository (path: #{p})"
      return []
    end

    if not File::file?(git_conf)
      Log.error "Missing git configuration file (missing: #{git_conf})"
      return []
    end

    config = ParseConfig.new(git_conf)

    remotes = config.params.keys.find_all{|i|i.start_with?('remote ')}
    remote_repos = remotes.map{|r| config.params[r]['url']}
    url_patterns = (type.nil?) ? GIT_URLS.values.flatten : GIT_URLS[type]
    valid_repos = remote_repos.map do |r|
        url_patterns.map{|p| p.match(r) }.compact.first
      end.compact
  end

end
