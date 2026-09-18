module "ec2" {
  source = "./modules/ec2"

  ami = var.ami_id

  private_subnet_id = module.vpc.lab_private_1a_subnet
  public_subnet_id  = module.vpc.lab_public_1a_subnet

  web_server_sg_ids = [module.security_group.web_server_sg_id]
  app_server_sg_ids = [module.security_group.app_server_sg_id]

  web_server_key_name        = var.web_server_key_name
  web_server_public_key_name = file(var.web_server_public_key_name)
  app_server_key_name        = var.app_server_key_name
  app_server_public_key_name = file(var.app_server_public_key_name)

  web_server_user_data = file(var.web_server_user_data)
}

module "security_group" {
  source = "./modules/security_group"

  lab_vpc_id = module.vpc.lab_vpc_id
}

module "vpc" {
  source = "./modules/vpc"
}