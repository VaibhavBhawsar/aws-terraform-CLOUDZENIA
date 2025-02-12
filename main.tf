# Calls all modules
module "networking" {
  source = "./modules/networking"
}
module "ecs" {
  source = "./modules/ecs"
}
module "rds" {
  source = "./modules/rds"
}
module "ec2" {
  source                = "./modules/ec2"
  private_subnet_id     = module.networking.private_subnet_id
  ec2_security_group_id = module.networking.ec2_security_group_id 
}
module "s3" {
  source = "./modules/s3"
}