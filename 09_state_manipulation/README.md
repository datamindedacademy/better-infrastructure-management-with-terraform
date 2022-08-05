# State manipulation

Like an accountant, Terraform diligently keeps track of the infrastructure it created for you in the state file.
In most scenario's, you don't need to interact with the state yourself.

Sometimes, however, you do need to get your hands dirty and perform some 'surgery' on the state file. In this exercise,
you'll see some common cases of when and how to do this.

## Goal of this exercise

To see what you can do with the Terraform state, have a look at the output of `terraform state --help`.

Now considering the following scenario's:

1. The S3 bucket you created as a data scientist in the `s3.tf` file should be managed by the platform team, so that they can control the
   data access permissions. As the bucket already contains some valuable data, you don't want to delete it. Remove the bucket manually
   from your state file.
2. You've heard that blockchain is the next big thing, so you and some colleagues started playing with the new AWS Quantum Ledger Database
   (QLDB) service. You've created a Ledger by clicking a few buttons in the AWS Console (try to do this yourself! If you get stuck, ask the course assistant to help you). Turns out that the POC blockchain application you build is actually
   useful, and you're requested to incorporate the QLDB into the existing infrastructure codebase, without deleting any of the transactions in the ledger.
3. In exercise 4, you created a module from scratch. As with normal code, however, such abstractions (and modules are abstractions!) are not always obvious
from the start. More often than not, you will have to move code around, and restructure along the way. As Terraform interprets each folder with .tf files as a module,
   moving resources into a new module deletes the resource and then recreates it. But what if that resource is crucial to the operations of your
   organization, and has to run with zero downtime? Imagine for example that the notebook defined in `notebook.tf` is running a heavy ML training job for days on end.
   You want to refactor it together with the `security group.tf` and the networking `ssm_parameters.tf` config into a module ASAP, without having to wait for the training job to finish.
   How can you do this? Apply the resources in this directory, and then migrate them to a new module.

   **! IMPORTANT !**

   Replace `$yourname` in the `provider.tf` backend config to your own name!
