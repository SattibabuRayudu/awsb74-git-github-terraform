module "alpha_vpc_1" {
  source             = "../modules/1.network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  owner              = var.owner
}

#We can directly provide values as shown below which is not recomanded.
module "alpha_vpc_2" {
  source             = "../modules/1.network"
  vpc_cidr           = "10.205.0.0/16"
  vpc_name           = "superstar"
  environment        = "dev"
  public_cidr_block  = ["10.205.1.0/24", "10.205.2.0/24", "10.205.3.0/24"]
  private_cidr_block = ["10.205.10.0/24", "10.205.20.0/24", "10.205.30.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  owner              = "JavaAppTeam"
}

