require 'highline/import'

module LoginHelper

  def user; @user ||= get_user; end
  def get_user
    cli.ask("Enter username: "){|q| q.echo = true}
  end

  def password; @password ||= get_password; end
  def get_password
    cli.ask("Enter password for user '#{user}': "){|q| q.echo = ''}
  end

  private

  def cli; @cli ||= HighLine.new; end

end