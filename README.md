# git-issue

* list issues (bitbucket ✔, github ✔, gitlab ✔)
* create issue (bitbucket ✔, github ✔, gitlab ✔)
* delete issue (bitbucket ✔, github ✔ (n/a), gitlab ✔ (n/a))
* cli integration ⋯

Why? There's excellent tools for GitHub out there, but I found integration for BitBucket or Gitlab lacking.

Under development...

# Dependencies

* gems: thor, parseconfig, bitbucket_rest_api

**Note**: At the time of this writing, bitbucket_rest_api is at version `0.1.4` and does not yet contain a [fix](https://github.com/vongrippen/bitbucket/commit/2098997cc102e8f5cf584df7d21c3303b518128c) (which is committed, but not yet updated) needed to function properly with oauth tokens. You may want to use the latest git version of this module instead.


# Security

Your login information will be stored by default in: `~/.git-issues.conf`. Make sure to keep this file's permissions limited (e.g. `0600`).

If you can, **do not use username and password** for login. Use OAuth instead. If you use username and password, both will be stored in the configuration file in an unencrypted state, which is highly discouraged.

Guides on how to create OAuth consumers:

* OAuth on GitHub: Go to Account Settings, Applications, and click on 'Create a new Personal Access Token'. Enter `git-issues` as the description. It is not yet supported, but will be very soon.
* [OAuth on BitBucket](https://confluence.atlassian.com/display/BITBUCKET/OAuth+on+Bitbucket)
