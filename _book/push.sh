commit=$1
gitbook build
git add *
git commit -m "$commit"
git push origin master
git subtree push -f --prefix=_book origin gh-pages