github () {
	if [ -z "$1" -a -z "$2" ]
	then
		echo 'usage: github <new-repo-name> "<repo description>"'
	else
		mkdir $1
		cd $1
		git init
		remoterepo "$@"
    # SSH Github connection
		git remote add origin git@github.com:YOUR_GITHUB_USERNAME/$1
    # HTTPS Github connection
		#git remote add origin https://github.com/YOUR_GITHUB_USERNAME/$1
		git update-from origin master
		echo "# $1" > README.md
		git add .
		git commit -m "Added readme"
		git push -u origin master
	fi
}
