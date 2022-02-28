locals {
  ip_addresses = [] # TO DO: provide a list of IP addresses that should be able to SSH into your notebook
  name         = "" # TO DO: fill in the name of your notebook
}


module "secure_notebook" {
  source        = "./secure_notebook"
  ip_addresses  = local.ip_addresses
  notebook_name = local.name
  instance_type = "ml.t2.medium"
}




