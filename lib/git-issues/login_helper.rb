require 'highline/import'

module LoginHelper
  def oauth_token
    @oauth_token ||= get_open("Enter OAuth token: ")
  end

  def oauth_secret
    @oauth_secret ||= get_secret("Enter OAuth secret: ")
  end

  def user
    @user ||= get_open("Enter username: ")
  end

  def password
    @password ||= get_secret("Enter password for user '#{user}': ")
  end

  private

  def get_open prompt
    cli.ask(prompt){|q| q.echo = true}
  end

  def get_secret prompt
    cli.ask(prompt){|q| q.echo = ''}
  end

  def cli; @cli ||= HighLine.new; end

end