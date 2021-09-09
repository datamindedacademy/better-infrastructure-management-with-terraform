# Remote backend 

Terraform keeps track of the infrastructure it is managing in a state file. By default, Terraform
stores this state file locally, next to the files in which you define your infrastructure. This makes collaboration on a
common set of infrastructure more difficult, as you would need sync the local state files of each individual collaborator.

A solution to this problem is the use of a remote backend, containing a single state file, i.e., a single source of truth.
In AWS, the most commonly used remote backend is S3. You can combine this with DynamoDB locking to avoid concurrency issues.

## Goal of this exercise

Set up a secure remote S3 backend, i.e. an S3 backend with versioning, encryption and DynamoDB locking of the state file.
To get you started, we already created a `remote_setup` folder, containing some incomplete Terraform configuration files. `cd` into that directory, and after completing the code, try to `terrafrom apply` the infrastructure. Note that to set up the remote backend, you will have to use a local state (as there is no remote backend yet, right?)! Then, navigate back to the root directory of the exercise and configure the `provider` block with your newly created remote `backend`. 


For inspiration and additional hints, have a look at the official [Terraform documentation](https://www.terraform.io/docs/language/settings/backends/s3.html) for the different backends.