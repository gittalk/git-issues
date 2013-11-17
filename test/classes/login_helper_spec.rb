require 'minitest_helper'

describe LoginHelper do
  before :each do 
    @l = Class.new do; include LoginHelper end.new
    @config_path = Tempfile.new('foo').path
    File::write(@config_path, '')
    @l.instance_variable_set :@config_file, @config_path
  end

  it "should use the config file if one was configured" do
    @l.config_file.must_equal @config_path
  end

  it "should default to config file in home folder if none is configured" do
    @l.instance_variable_set :@config_file, nil
    @l.config_file.must_equal "~/.git-issues.conf"
  end

  it "should read values from config file" do
    v = "testvalue"
    f = "testfield"
    File::write(@config_path, "#{f} = #{v}")
    @l.get_or_set f do nil end.must_equal v
  end

  it "should write a config item to file if none is configured" do
    v = "testvalue"
    f = "testfield"
    @l.get_or_set f do v end.must_equal v
    File::read( @config_path ).must_equal "#{f} = #{v}\n\n"
  end

  it "should have a method to provide an oauth_consumer_key" do
    @l.must_respond_to :oauth_consumer_key
  end

  it "should have a method to provide an oauth_consumer_secret" do
    @l.must_respond_to :oauth_consumer_secret
  end

  it "should have a method to provide a username" do
    @l.must_respond_to :user
  end

  it "should have a method to provide a password for a username" do
    @l.must_respond_to :password
  end
end
