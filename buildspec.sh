#!/bin/bash
if [ "$CODEBUILD_WEBHOOK_HEAD_REF" = "refs/heads/production" ]
then
    echo "Deploy Production"
    serverless deploy --stage prod
elif [ "$CODEBUILD_WEBHOOK_HEAD_REF" = "refs/heads/development" ]
then
    echo "Deploy Development"
    serverless deploy --stage dev
elif [ "$CODEBUILD_WEBHOOK_HEAD_REF" = "refs/heads/staging" ]
then
    echo "Deploy Staging"
    serverless deploy --stage stg
else echo "demo"
fi

