commit=$1
gitbook build
git add *
git commit -m "$commit"
git push origin master
git subtree pull --prefix=_book origin gh-pages
git subtree push --prefix=_book origin gh-pages