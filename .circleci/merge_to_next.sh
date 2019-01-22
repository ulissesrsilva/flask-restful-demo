#!/bin/bash
set -e
set -u
source .circleci/setup_env.sh
if [ "$NEXT_FLOW" != "master" ]; then
    git config --global user.name "gustavo-lopes-b"
    git config --global user.email "lopesb.gustavo@gmail.com"
    git config --global user.password "${GITHUB_API_KEY}"
    git config --global push.default matching
    git checkout -b $NEXT_FLOW
    echo  "GO TO BRANCH '${NEXT_FLOW}'"
    git push -f --set-upstream origin $NEXT_FLOW
    echo "Merged '${NEXT_FLOW}' branch"
else
    echo "FINISHED MIGRATION"
fi