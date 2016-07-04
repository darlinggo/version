githash=$(git rev-parse --short HEAD)
gittag=$(git name-rev --tags --name-only $githash)
gitbranch=$(git rev-parse --abbrev-ref HEAD)
now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION=${VERSION:-$githash}
TAG=${TAG:-$gittag}
BRANCH=${BRANCH:-$branch}
TIMESTAMP=${TIMESTAMP:-$now}
export LDFLAGS="-X darlinggo.co/version.Hash=${VERSION} -X darlinggo.co/version.Tag=${TAG} -X darlinggo.co/version.Branch=${BRANCH} -X darlinggo.co/version.Timestamp=${TIMESTAMP}"
