# ───────────────────────────────
# 🔍 Fetch default VPC and Subnets
# ───────────────────────────────
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Optional: Use a local var for cleaner references
locals {
  default_vpc_id  = data.aws_vpc.default.id
  default_subnet  = data.aws_subnet_ids.default.ids[0]
}

# ───────────────────────────────
# 🔐 EC2 Key Pair Module
# ───────────────────────────────
module "key_pair" {
  source           = "../../../ps-terraform-modules/Java-project-01/key-pair"
  key_name         = var.key_name
  public_key_path  = var.public_key_path
}

# ───────────────────────────────
# 🔒 Security Group Module
# ───────────────────────────────
module "security_group" {
  source = "../../../ps-terraform-modules/Java-project-01/security-group"
  name   = var.sg_name
  vpc_id = local.default_vpc_id
}

# ───────────────────────────────
# 🖥️ EC2 Instance Module
# ───────────────────────────────
module "ec2_instance" {
  source             = "../../../ps-terraform-modules/Java-project-01/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = local.default_subnet
  availability_zone  = var.availability_zone
  key_name           = module.key_pair.key_name
  security_group_id  = module.security_group.security_group_id
  name               = var.ec2_name
}