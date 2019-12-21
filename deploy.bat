echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

: Build the project.
hugo -t "whiteplain"


: Go To Public folder
cd public
: Add changes to git.
git add .

: Commit changes.
set msg="rebuilding site `date`"
if not %1=="" (
  set msg=%1
)
git commit -m %msg%

: Push source and build repos.
git push origin master

: Come Back up to the Project Root
cd ..

: Commit source repository changes
git add .
git commit -m "$msg"
git push

pause
