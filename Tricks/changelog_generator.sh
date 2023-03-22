#!/bin/bash
# This generator use the conventional commits:
# <type>[optional scope]: <description>

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] || [ -z "$5" ] 
then
    echo -e "ERROR: Missing Parameters\n" 
    echo -e "Command: \n./changelog.sh {REPOSITORY_URL} {LATEST_TAG} {PREVIOUS_TAG} {RELEASE_DATE} {VERSION}\n" 
    echo -e "Example: \n./changelog.sh \"http://gitlab.com/asd/asd\" \"2021-11-26\" \"v4.1.1\" \"v4.1.1\" \"v4.2.1\" \n" 
    exit 9999 # die with error code 9999
fi

echo "Generating CHANGELOG.md ... "

# Repo URL to base links off of
REPOSITORY_URL=$1

RELEASE_DATE=$2

# Branches or tags to compare
LATEST_TAG=$3
PREVIOUS_TAG=$4

# Release version
VERSION=$5

# Get a log of commits that occured between two tags
COMMITS=$(git log $PREVIOUS_TAG..$LATEST_TAG --pretty=format:"%H")

MARKDOWN=''

FEAT=''
FIX=''
DOCS=''
STYLE=''
REFACTOR=''
TEST=''
CHORE=''
PERF=''
OTHER=''

# Loop over each commit and look for merged intos
for COMMIT in $COMMITS; do

	# Get data to use in markdown 
	BODY=$(git log -1 ${COMMIT} --pretty=format:"%b")
	SUBJECT=$(git log -1 ${COMMIT} --pretty=format:"%s")
	NOTES=$(git log -1 ${COMMIT} --pretty=format:"%N")
	AUTHOR=$(git log -1 ${COMMIT} --pretty=format:"%an")
	BRANCH=$(git log -1 ${COMMIT} --pretty=format:"%D")
	ABBREVHASH=$(git log -1 ${COMMIT} --pretty=format:"%h")
	TYPE=$(echo ${SUBJECT} | grep -oP "^([a-zA-Z].*)\:")
	SUBJECT=$(echo "$SUBJECT" | sed -r "s/^(${TYPE})//g")
	TYPE=${TYPE//\:/}

	# echo -e "-----"
	# echo -e "TYPE: $TYPE"
	# echo -e "BRANCH: $BRANCH"
	# echo -e "SUBJECT: $SUBJECT"
	# echo -e "NOTES: $NOTES"
	# echo -e "BODY: $BODY"


	MERGE_PHRASE='Merge branch'
	if [[ "$SUBJECT" != *"$MERGE_PHRASE"* ]]; then
		LINE="\n - $SUBJECT ([$ABBREVHASH]($REPOSITORY_URL/commit/$COMMIT) by $AUTHOR)\n\t$NOTES"

		case $TYPE in
			feat)
				FEAT+="$LINE"
			;;
			fix)
				FIX+="$LINE"
			;;
			docs)
				DOCS+="$LINE"
			;;
			style)
				STYLE+="$LINE"
			;;
			refactor)
				REFACTOR+="$LINE"
			;;
			test)
				TEST+="$LINE"
			;;
			chore)
				CHORE+="$LINE"
			;;
			perf)
				PERF+="$LINE"
			;;
			other)
				OTHER+="$LINE"
			;;
			*)
				OTHER+="$LINE"
			;;
		esac
	fi
done

if [ ! -z "$FEAT" ]; then
	MARKDOWN+="\n### Features: \n"
	MARKDOWN+="$FEAT\n"
fi

if [ ! -z "$FIX" ]; then
	MARKDOWN+="\n### Bug Fixing: \n"
	MARKDOWN+="$FIX\n"
fi

if [ ! -z "$STYLE" ]; then
	MARKDOWN+="\n### Styles: \n"
	MARKDOWN+="$STYLE\n"
fi

if [ ! -z "$REFACTOR" ]; then
	MARKDOWN+="\n### Refactor: \n"
	MARKDOWN+="$REFACTOR\n"
fi

if [ ! -z "$TEST" ]; then
	MARKDOWN+="\n### Testing: \n"
	MARKDOWN+="$TEST\n"
fi

if [ ! -z "$DOCS" ]; then
	MARKDOWN+="\n### Documentation: \n"
	MARKDOWN+="$DOCS\n"
fi

if [ ! -z "$CHORE" ]; then
	MARKDOWN+="\n### Configuration: \n"
	MARKDOWN+="$CHORE\n"
fi

if [ ! -z "$PERF" ]; then
	MARKDOWN+="\n### Performance: \n"
	MARKDOWN+="$PERF\n"
fi

if [ ! -z "$OTHER" ]; then
	MARKDOWN+="\n### Other: \n"
	MARKDOWN+="$OTHER\n"
fi

HEAD="## [$VERSION]($REPOSITORY_URL/compare/$PREVIOUS_TAG...$LATEST_TAG) - $RELEASE_DATE"

MARKDOWN="\n$HEAD\n$MARKDOWN"

# Save our markdown to a file, into line 4

head -n 3 CHANGELOG.md > CHANGELOG_tmp.md
echo -e $MARKDOWN >> CHANGELOG_tmp.md
tail -n+3 CHANGELOG.md >> CHANGELOG_tmp.md

cat CHANGELOG_tmp.md > CHANGELOG.md 

rm -f CHANGELOG_tmp.md
