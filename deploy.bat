
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

: Build the project.
hugo -t "whiteplain"


: Go To Public folder
cd public
: Add changes to git.
git add .

: Commit changes.
set comment="%1 \n rebuilding site %date% %time% "
git commit -m %comment%

: Push source and build repos.
git push origin master

: Come Back up to the Project Root
cd ..

: Commit source repository changes
git add .
git commit -m %comment%
git push origin master

pause
