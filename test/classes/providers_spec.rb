require 'minitest_helper'

describe RepoProviders do
  before :each do
    @ps = RepoProviders.new
  end

  it "contains providers" do
    @ps.must_respond_to :providers
    @ps.providers.must_be_instance_of Array
  end

  it "contains bitbucket provider" do
    @ps.providers.must_include RepoProvider::Bitbucket
  end

  it "contains github provider" do
    @ps.providers.must_include RepoProvider::Github
  end

  it "contains gitlab provider" do
    @ps.providers.must_include RepoProvider::Gitlab
  end

end
