#!/usr/bin/ksh

# Please provide the two tags as arguments while running the script

# Before running, please substitute lines 8 and 9 with your github.com username and password,
# and make sure you have access to the base and overlay projects through those credentials

user="ripboy"
pwd="temporarypassword"

tag1=$1
tag2=$2


overlayRepo="github.com/KualiCo/financials-iu.git"
baseRepo="github.com/KualiCo/financials.git"

function clone {
	git clone "https://$user:$pwd@$overlayRepo"
	git clone "https://$user:$pwd@$baseRepo"
}

# clone

# comparison is the directory the final results will go in
# mkdir comparison


#kfs-files.txt contains list of files that were changed in base project between two tags
function findChangedFilesInForkTags {
	cd financials
	git diff $tag1 $tag2 --pretty=format: --name-only | sort | uniq > ../comparison/kfs-files.txt
}

findChangedFilesInForkTags


#iu-files.txt is a list of all files in overlay
function findAllFilesInOverlay {
	cd ../financials-iu
	find src -type f  | sort | uniq > ../comparison/iu-files.txt
}

findAllFilesInOverlay


cd ../comparison


#checking which files in overlay have been changed in base
for line in $(<kfs-files.txt);
do
	#extracting filename from path (the part after the last /)
	file=${line##*/}
	grep $file iu-files.txt >> changedFilesPresentInOverlay.txt
done


#checking which of the changed files in base are present in overlay (duplicate files)
#this list of files is effectively the same as the list of files in changedFilesPresentInOverlay.txt above,
#but they are located in separate projects (overlay/base), hence have separate paths, hence we are storing them in separately.
for line in $(<iu-files.txt);
do
	#extracting filename from path (the part after the last /)
	file=${line##*/}
	grep $file kfs-files.txt >> duplicates-files.txt
done


# get list of database file changes
grep '/db/.*/[^next.release.xml]' kfs-files.txt > database-files.txt


# get list of property file changes
grep 'DefaultConfig\.properties' kfs-files.txt > property-files.txt


# get list of workflow file changes
grep 'resources/.*/workflow/.*Documents.xml' kfs-files.txt > workflow-files.txt


# get list of miscellaneous changes
for i in $(<kfs-files.txt);
do
	if ! (grep -q $i duplicates-files.txt database-files.txt property-files.txt workflow-files.txt); then
		print $i >> miscellaneous-files.txt
	fi
done


echo "# Release Report" > release_report.md
echo "Changes made between releases $tag1 and $tag2" >> release_report.md


# looping over each file in different categories and running git diff, storing changes to release_report.md 

echo "## Database File Changes" >> release_report.md

# var to store the file count
fileCount=1



# Under each of the below categories, add a condition such that if the respective array is empty, the report says "No changes for this section"




for i in $(<database-files.txt);
do
	echo "File #$((fileCount++))" >> release_report.md
	echo "$i:\n" >> release_report.md
	cd ../financials
	git diff $tag1 $tag2 -- $i >> ../comparison/release_report.md
	echo "\n" >> ../comparison/release_report.md
	cd ../comparison
	echo "---" >> release_report.md
done




echo "## **Duplicate Files Changes**" >> release_report.md

for i in $(<duplicates-files.txt);
do
	echo "*File #$((fileCount++))*\n" >> release_report.md
	echo "**$i**\n" >> release_report.md
	cd ../financials
	echo "\`\`\`diff" >> ../comparison/release_report.md
	git diff $tag1 $tag2 -- $i >> ../comparison/release_report.md
	echo "\`\`\`" >> ../comparison/release_report.md
	cd ../comparison
	echo "---" >> release_report.md
done




echo "## **Properties Files Changes**" >> release_report.md

for i in $(<property-files.txt);
do
	echo "*File #$((fileCount++))*\n" >> release_report.md
	echo "**$i**\n" >> release_report.md
	cd ../financials
	echo "\`\`\`diff" >> ../comparison/release_report.md
	git diff $tag1 $tag2 -- $i >> ../comparison/release_report.md
	echo "\`\`\`" >> ../comparison/release_report.md
	cd ../comparison
	echo "---" >> release_report.md
done




echo "## **Workflow File Changes**" >> release_report.md

for i in $(<workflow-files.txt);
do
	echo "*File #$((fileCount++))*\n" >> release_report.md
	echo "**$i**\n" >> release_report.md
	cd ../financials
	echo "\`\`\`diff" >> ../comparison/release_report.md
	git diff $tag1 $tag2 -- $i >> ../comparison/release_report.md
	echo "\`\`\`" >> ../comparison/release_report.md
	cd ../comparison
	echo "---" >> release_report.md
done




echo "## **Miscellaneous File Changes**" >> release_report.md


###########################################################
#                                                         #
# remove changelog.txt from the miscellaneous-files array #
#                                                         #   
###########################################################


for i in $(<miscellaneous-files.txt);
do
	echo "*File #$((fileCount++))*\n" >> release_report.md
	echo "**$i**\n" >> release_report.md
	cd ../financials
	echo "\`\`\`diff" >> ../comparison/release_report.md
	git diff $tag1 $tag2 -- $i >> ../comparison/release_report.md
	echo "\`\`\`" >> ../comparison/release_report.md
	cd ../comparison
	echo "---" >> release_report.md
done


# appending changelog.txt at the very bottom
echo "*File #$((fileCount++))*\n" >> release_report.md
echo "**CHANGELOG.txt**\n" >> release_report.md
cd ../financials
echo "\`\`\`diff" >> ../comparison/release_report.md
git diff $tag1 $tag2 -- CHANGELOG.txt >> ../comparison/release_report.md
echo "\`\`\`" >> ../comparison/release_report.md
cd ../comparison
echo "---" >> release_report.md



cd ..

#rm -rf financials
#rm -rf financials-iu