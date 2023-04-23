#!/bin/bash
npm install -g serverless
npm install
if [[ "$CODEBUILD_WEBHOOK_HEAD_REF" == refs/tags/* ]];
then
    echo "Deploy Production"
    serverless deploy --stage prod
elif [ "$CODEBUILD_WEBHOOK_HEAD_REF" = "refs/heads/develop" ]
then
    echo "Deploy Development"
    serverless deploy --stage dev
elif [ "$CODEBUILD_WEBHOOK_HEAD_REF" = "refs/heads/main" ]
then
    echo "Deploy Staging"
    serverless deploy --stage stg
else echo "demo"
fi