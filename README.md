# aws-terraform-training


## Getting started

You can do the exercise either on your local machine with your IDE of choice, or use a preconfigured Gitpod Cloud development environment (see below). If you'd like to
try out Gitpod, you can skip the Terraform installation step below. 

### Install Terraform 
To install Terraform for the exercises, we recommend using a version manager such as tfswitch or tfenv.

On MacOS and Linux systems, you can install them with brew:

`brew install warrensbox/tap/tfswitch` or `brew install tfenv`

On Windows there is currently no widely adopted Terraform version manager. You can install a specific version `x.y.z` of Terraform with Chocolately:

`choco install terraform --version=x.y.z`

For the exercises, we'll be using Terraform versions `>=1.0.0`

### Use Gitpod 

Create a free Gitpod account at [gitpod.io](https://www.gitpod.io). You can then open the exercise repository in a cloud IDE via the following link:

https://gitpod.io/#https://github.com/datamindedbe/aws-terraform-training/tree/main

This will set up a preconfigured development environment for you, which includes both `tfswitch` and the `awscli`. 

## Configure AWS credentials 

In order for Terraform to deploy infrastructure on AWS, Terraform needs to make authenticated API requests on your behalf. 
You will receive an `AWS_ACCES_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from the instructor. 

First make sure that you have the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
installed. Then run `aws configure --profile academy` and fill in the access keys and configure the region and output format as follows:

```
aws configure --profile academy
AWS Access Key ID [None]: $YOUR_ACCES_KEY_ID
AWS Secret Access Key [None]: $YOUR_SECRET_ACCES_KEY
Default region name [None]: eu-west-1
Default output format [None]: json
```

## Configure your student information

Some of the exercise require you to provide your name and id (which we will assign to you) to make sure that Terraform
creates unique resources. You can enter your name and id in the `student_info.sh` file in the root of the repository.
Then run `chmod+x student_info.sh && source ./student_info.sh` and Terraform will automatically use this info as input.