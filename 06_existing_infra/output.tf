output "notebook_url" {
  value = join("", [aws_sagemaker_notebook_instance.notebook_instance.url, "/tree"])
}