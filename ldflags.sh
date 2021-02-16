githash=$(git rev-parse --short HEAD)
gittag=$(git name-rev --tags --name-only $githash)

if [ "$semverIfJenkins" == "1" ]
then
	if [[ $gittag == "jenkins"* ]]
	then
	## We've got some bogus Jenkins tag
	## Get the latest semver-style tag
		gittag=$(git tag -l "v*" | tail -n 1)
	fi
fi

gitbranch=$(git rev-parse --abbrev-ref HEAD)
now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION=${VERSION:-$githash}
TAG=${TAG:-$gittag}
BRANCH=${BRANCH:-$gitbranch}
TIMESTAMP=${TIMESTAMP:-$now}
PACKAGE=darlinggo.co/version
if [ ! -z $PACKAGE_PREFIX ]; then
	PACKAGE="${PACKAGE_PREFIX}/vendor/${PACKAGE}"
fi
export LDFLAGS="-X ${PACKAGE}.Hash=${VERSION} -X ${PACKAGE}.Tag=${TAG} -X ${PACKAGE}.Branch=${BRANCH} -X ${PACKAGE}.Timestamp=${TIMESTAMP}"
