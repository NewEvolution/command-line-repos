# command-line-repos

## Creating GitHub Repositories from the Terminal

### Prerequsites:
- Install [jq](https://stedolan.github.io/jq/), a command line JSON processor.
- Add the [update-from](https://adamcod.es/2014/12/10/git-pull-correct-workflow.html) alias to your `~/.gitconfig`.
- Create a [GitHub Personal access token](https://github.com/settings/tokens) for accessing the GitHub API.
  - Token needs _gist, repo, user_ rights.
  - I recommend making a new token specifically for this script suite.
- Add the token to your `~/.gitconfig` as `github.token`.

##### Example completed `~/.gitconfig`:
```
[alias]
	update-from = "!f() { git fetch $1 --prune; git merge --ff-only $1/$2 || git rebase --preserve-merges $1/$2; }; f"
[github]
	token = arglebarglearglebarglearglebargleargleba
```

### Setup:
- Edit the _github.sh_ script to suit your needs.
  - If you use SSH to connect to GitHub, change the line below _SSH_ to your GitHub username.
  - If you use HTTPS to connect to GitHub, comment out the _SSH_ line and uncomment the _HTTPS_ line, and change the name to your GitHub username.
- Copy the modified contents of _github.sh_ into your shell's configuration file (_~/.bashrc_, _~/.zshrc_ etc.)
- Edit the _remoterepo_ script to your liking.  I've included the MIT license, but you can change that and add any options available in the [GitHub API](https://developer.github.com/v3/repos/#create)
- Copy the _remoterepo_ script to a directory in your _PATH_, the canonical location would be in _/usr/local/sbin/_ but anywhere on your _PATH_ will work.
- Make _remoterepo_ executable if it isn't already `chmod +x /your/path/to/remoterepo`

### Usage:
Run `github repo-name "Short repo description"` to create a new directory named `repo-name` with the description provided, create a GitHub repository of the same name, and initialize the repo with a license and README containing the repo name.
