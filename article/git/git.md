# Config when working with multiple git accounts

File `~/.ssh/config` is also very useful when you have to work with multiple git accounts.

```config
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github

Host github_as_alice
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_alice

Host github_as_bob
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_bob
```

Default `github.com` will work by default.

For alice: replace 'git@github.com' with 'git@github\_as\_alice' when you use `git clone` or `git remote add origin`.

For bob: replace 'git@github.com' with 'git@github\_as\_bob' when you use `git clone` or `git remote add origin`.

