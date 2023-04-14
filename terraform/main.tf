terraform {
  backend "s3" {
    bucket = "anderovsk-terraform"
    key    = "codebuild-tripee.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      version = "~> 3.50.0"
    }
  }
}

module "codebuild" {
  source                  = "./codebuild"
  name                    = "anubis-pipeline"
  env                     = terraform.workspace
  github_location         = "https://github.com/anderovsk/serverlesss-pipeline-codebuild.git"
  source_version          = "*"
  head_ref                = "^refs/tags/.*"
  iam_role                = "arn:aws:iam::xxxxxxxxxxxx:role/service-role/codebuild-anderovsk"
  buildspec_file          = "buildspec.yml"
}