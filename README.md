# command-line-repos

## Creating GitHub Repositories from the Terminal

### Prerequsites:
- Install [jq](https://stedolan.github.io/jq/), a command line JSON processor.
- Add the [update-from](https://adamcod.es/2014/12/10/git-pull-correct-workflow.html) alias to your `~/.gitconfig`.
- Create a [GitHub Personal access token](https://github.com/settings/tokens) for accessing the GitHub API.
  - Token needs _gist, repo, user_ rights.
  - I recommend making a new token specifically for this script suite.
- Add the token to your `~/.gitconfig` as `github.token`.



### Setup:

