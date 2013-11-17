require 'highline/import'
require 'parseconfig'
require 'zlog'

module LoginHelper
  Log = Logging.logger[self]

  def config_file
    @config_file ||= "~/.git-issues.conf"
  end

  def oauth_token
    @oauth_token ||= get_open("Enter OAuth token: ", "oauth-token")
  end

  def oauth_secret
    @oauth_secret ||= get_secret("Enter OAuth secret: ", "oauth-secret")
  end

  def oauth_token_and_secret
    t = oauth_token
    ( t.empty? ) ? [nil,nil] : [t, oauth_secret]
  end

  def user
    @user ||= get_open("Enter username: ", "username")
  end

  def password
    @password ||= get_secret("Enter password for user '#{user}': ", "secret")
  end

  def get_or_set field, &block
    f = get_from_config_file field
    if f.nil?
      f = block.()
      save_to_config_file field, f
    end
    f
  end

  private

  def get_conf
    conf_path = File::expand_path(config_file)
    if not File::exists?(conf_path)
      Log.info "Creating configuration in #{conf_path}"
      File::write(conf_path,"")
    elsif not File::file?(conf_path)
      Log.abort "Can't write configuration file to #{conf_path}"
    end
    ParseConfig.new(conf_path)
  end

  def get_from_config_file field
    config = get_conf
    config.params[field]
  end

  def save_to_config_file field, value
    config = get_conf
    config.params[field] = value.to_s

    file = File.open(File::expand_path(config_file), 'w+')
    config.write(file)
    file.close
  end

  def get_open prompt, field
    get_or_set field do
      cli.ask(prompt){|q| q.echo = true}.strip
    end
  end

  def get_secret prompt, field
    get_or_set field do
      cli.ask(prompt){|q| q.echo = ''}.strip
    end
  end

  def cli; @cli ||= HighLine.new; end

end