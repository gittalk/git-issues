# Changelog

## 0.1.4

* feature: add https-style urls to github and bitbucket
* bugfix: check if login config was created before using it
* bugfix: fix rubinius tests and support

## 0.1.3

* feature: close issues (github, bitbucket, gitlab)
* feature: reopen issues (github, bitbucket, gitlab)
* improvement: check response when closing issue (github, bitbucket)
* bugfix: add minitest dependency to Gemfile
* bugfix: update travis ci tests to 2.1.1
* bugfix: update gemfile.lock
* bugfix: remove ruby 1.9.2 from the list of supported platforms
* bugfix: add missing rake to gemfile

## 0.1.2

* feature: add an option --short to git issues list to show a shorter overview
* feature: show description for issues when listing them
* feature: support ssh://-style urls
* feature: gitlab: add support for creating issues + clarify delete actoin
* feature: add support for listing issues from gitlab
* feature: support adding and deleting issues to/from github
* feature: added github provider
* feature: add configuration file
* feature: added add, delete, cli
* feature: list issues
* improvement: give feedback when an issue is created
* improvement: expose the provider of gitlab, bitbucket, and github (useful on cli)
* improvement: run the `git issues list` by default if no argument is provided
* improvement: added gemfile and lock for dependency tracking
* improvement: sort issues list by id number (decreasing)
* improvement: add support for creating issues without a body
* improvement: add links to api documentations to all providers
* improvement: gitlab: only detect project id once, then reuse it
* improvement: unified github handling under octokit api
* improvement: save configuration options under the groupname of each provider
* improvement: limit file permissions for config file (default: ~/.git-issues.conf to 0600)
* improvement: let bitbucket use oauth token and secret
* improvement: modular structure for providers created
* bugfix: support old bitbucket ssh-style urls
* bugfix: add missing requirement of zlog to gemspec
* bugfix: gitlab: show only non-closed issues by default
* bugfix: gitlab: use internal id (iid) instead of id for issue identification
* bugfix: show all issues in github if called with --all
* bugfix: set the oauth token for github via access_token field
* bugfix: moved bitbucket gem to inside the class\n\nit will otherwise conflict with later github gem on nokogiri dependency
* bugfix: updated bitbucket oauth authentication to work correctly with consumer key and secret
* bugfix: expand file path before writing
* bugfix: abort oauth authentication if token is empty, not nil
* bugfix: write configuration to file correctly
