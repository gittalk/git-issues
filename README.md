# git-issue
[![Build Status](https://travis-ci.org/gittalk/git-issues.png)](https://travis-ci.org/gittalk/git-issues)

✔ supported, ∅ not supported by this service, ✘ not supported by git-issues (yet)

* list issues (bitbucket ✔, github ✔, gitlab ✔)
* create issue (bitbucket ✔, github ✔, gitlab ✔)
* close issue (bitbucket ✔, github ✔, gitlab ✔)
* reopen issue (bitbucket ✔, github ✔, gitlab ✔)
* delete issue (bitbucket ✔, github ∅, gitlab ∅)
* integrated cli (needs improvement)

Why? There's excellent tools for GitHub out there, but I found integration for BitBucket or Gitlab lacking.

# Installation

You can build the gem and install it on your system:

    bundle install
    bundle exec gem build git-issues.gemspec
    bundle exec gem install *gem

Requires ruby >= 1.9.3.

# Usage

## Setup a cloned repo

    $ cd /path/to/your/repo
    $ git issues

You will be asked for your login credentials. Further information is described in section security.

## Get issues

    $ git issues
    -- Using: git@github.com:gittalk/git-issues.git
    22  | open     | Usage instructions
    20  | open     | Display instructions for setup when the command is run the first time
    18  | open     | clearly describe OAuth service when requesting the token e.g. Github OAuth

## Add new issues

The format is `add <title> [<content>]`

    $ git issues add "Git issue title" "Git issue descripton"
    -- Using: git@github.com:gittalk/git-issues.git
    ++ created issue 24

## Closing or deleting issues

Close an issue with `close <id>`:

    $ git issues close 24

Use `delete <id>` to remove an issue. It is currently only supported by Bitbucket repos.

    $ git issues delete 24

# Security

Your login information will be stored by default in: `~/.git-issues.conf`. Make sure to keep this file's permissions limited (e.g. `0600`).

If you can, **do not use username and password** for login. Use OAuth instead. If you use username and password, both will be stored in the configuration file in an unencrypted state, which is highly discouraged.

How to get OAuth tokens:

* GitHub: Go to _Account Settings_, _Applications_, and click on _Create a new Personal Access Token_. Enter `git-issues` as the description. Use this token during first login.
* [OAuth on BitBucket](https://confluence.atlassian.com/display/BITBUCKET/OAuth+on+Bitbucket)
* Gitlab: Click on your profile, _Profile Settings_, _Account_ and use the _Private token_ found here.


# Contributing

Any contributions are welcome!

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


# License and Author

Author: Dominik Richter <dominik.richter@googlemail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
