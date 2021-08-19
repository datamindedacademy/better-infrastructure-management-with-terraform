// TO DO: create multiple secure notebooks by making use of the count and for_each keywords

module "secure_notebooks" {
  source        = "./secure_notebook"
  ip_address    = []
  notebook_name = ""
  instance_type = ""
}
