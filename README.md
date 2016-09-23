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
- Edit the `github.sh` script to suit your needs.
  - If you use SSH to connect to GitHub, change the line below `# SSH` to your GitHub username.
  - If you use HTTPS to connect to GitHub, comment out the line below `# SSH` and uncomment the line below `# HTTPS`, and change the name to your GitHub username.
- Copy the modified contents of `github.sh` into your shell's configuration file (`~/.bashrc`, `~/.zshrc` etc.)
- Edit the `remoterepo` script to your liking.  I've included the MIT license, but you can change that and add any options available in the [GitHub API](https://developer.github.com/v3/repos/#create)
- Copy the `remoterepo` script to a directory in your `PATH`, the canonical location would be in `/usr/local/sbin/` but anywhere on your `PATH` will work.
- Make `remoterepo` executable if it isn't already `chmod +x /your/path/to/remoterepo`

### Usage:
Run `github repo-name "Short repo description"` to create a new directory named `repo-name` with the description provided, create a GitHub repository of the same name, and initialize the repo with a license and README containing the repo name.
