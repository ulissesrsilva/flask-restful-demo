case $CIRCLE_BRANCH in
    "development")
        export ENVIRONMENT="development"
        export NEXT_FLOW="staging"
        export HEROKU_APP="flask-restful-demo-devel"
        ;;
    "staging")
        export ENVIRONMENT="staging"
        export NEXT_FLOW="production"
        export HEROKU_APP="flask-restful-demo-stg"
        ;;
    "production")
        export ENVIRONMENT="production"
        export NEXT_FLOW="master"
        export HEROKU_APP="flask-restful-demo-prod"
        ;;
esac
echo "Enviroment OK '${HEROKU_APP}'"