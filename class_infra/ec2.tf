resource "aws_instance" "academy-dev-env" {
  ami                         = "ami-02b4e72b17337d6c1" //Amazon Linux 2
  instance_type               = "t2.2xlarge"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name
  security_groups             = ["AcademyLabVM"]
  tags = {
    "Name" = "academy-dev-env"
  }
}

output "PublicDNS" {
  description = "Lab VM public DNS for SSH/Browser access"
  value       = aws_instance.academy-dev-env.public_dns
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "AcademyDevEnvSSHKey"
  public_key = var.ssh-public-key
}
