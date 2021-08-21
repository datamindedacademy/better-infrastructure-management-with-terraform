resource "aws_qldb_ledger" "blockchain_ledger" {
  name                = "terraform-workshop"
  deletion_protection = "false"
}