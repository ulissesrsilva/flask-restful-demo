set -e
set -u
source .circleci/setup_env.sh
echo "Pushing branch ${CIRCLE_BRANCH} to app ${HEROKU_APP}"
git remote add heroku https://heroku:$HEROKU_API_KEY@git.heroku.com/${HEROKU_APP}.git
git push -f heroku ${CIRCLE_BRANCH}:master