// TO DO: create multiple secure notebooks by making use of the count and for_each keywords

module "secure_notebooks" {
  source        = "./secure_notebook"
  ip_address    = "1.1.1.1"
  notebook_name = "single-notebook"
  instance_type = "ml.t2.medium"
}
