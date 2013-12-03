require 'git-issues/providers'

require 'parseconfig'
require 'zlog'

class GitIssues
  def version; '0.1.0' end
  Log = Logging.logger[self]

  attr_reader :providers
  def initialize
    @providers = RepoProviders.new
  end

  def gitReposFor path
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

    @providers.map_urls_to_provider( remote_repos )
  end

end
