require 'minitest_helper'

describe RepoProviders do
  before :each do
    @repo = RepoProviders.new
    @providers = @repo.providers.map do |c|
        c.new
      end
  end

  it "contains providers" do
    @repo.must_respond_to :providers
    @repo.providers.must_be_instance_of Array
  end

  it "contains bitbucket provider" do
    @repo.providers.must_include RepoProvider::Bitbucket
  end

  it "contains github provider" do
    @repo.providers.must_include RepoProvider::Github
  end

  it "contains gitlab provider" do
    @repo.providers.must_include RepoProvider::Gitlab
  end

  it "every provider has issues_list" do
    @providers.each do |provider|
      provider.must_respond_to :issues_list
    end
  end

  it "every provider has issue_create" do
    @providers.each do |provider|
      provider.must_respond_to :issue_create
    end
  end

  it "every provider has issue_delete" do
    @providers.each do |provider|
      provider.must_respond_to :issue_delete
    end
  end

end
