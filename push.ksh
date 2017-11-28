#!/usr/bin/ksh

user="ripboy"
pwd="temporarypassword"

cd comparison

rm *.txt
rm release_report.md

cd ..

./kfs_overlay_comparison.ksh 2017-10-19 2017-11-02

cd comparison

pwd

repo="github.com/ripboy/comparison.git"

git add -A
git commit -m "commit"
git push "https://$user:$pwd@$repo"
