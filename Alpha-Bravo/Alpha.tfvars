#Deploy To SREEK8S Account.
environment          = "dev"
aws_region           = "us-east-1"
vpc_cidr             = "192.168.0.0/16"
vpc_name             = "ALPHA"
public_cidr_block    = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
private_cidr_block   = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
owner                = "JavaAppTeam"
service_ports        = ["80", "443", "22", "3389", "3306"]
rolename             = "alpha-testrole-dev"
instanceprofilename  = "alpha-instprofile-dev"
iam_policy_name      = "alpha-iampolicy-dev"
instance_type        = "t2.micro"
key_name             = "Manju"
project_name         = "alpha"
albname              = "alpha-dev-alb"
albtgname            = "alpha-dev-alb-tg"
alb_certificate_arn  = "arn:aws:acm:us-east-1:672790302267:certificate/2e2ce451-201b-42bd-9e63-e4593032efc0"
nlbname              = "alpha-dev-nlb"
nlbtgname            = "alpha-dev-nlb-tg"
domainname           = "bhavaniinfo.xyz"
db_subnet_group_name = "alphadev"
allocated_storage    = "10"
engine               = "mysql"
engine_version       = "8.0.35"
identifier           = "alphardsdev1"
instance_class       = "db.t3.medium"
db_name              = "awsb74devinst"
username             = "adminsree"
bucket_name          = "alphab74devbucket001"
assume_rolename      = "arn:aws:iam::672790302267:role/awsb74-cross-account-role"
create_efs           = false
create_rds           = false
efs_name             = "alpha-dev-efs"
create_nlb           = true
create_alb           = true
#To use multiple workspaces parallelly, you can assign environment variables to the workspace name and run terraform commands.
#export TF_WORKSPACE=alpha-dev(or) $Env:TF_WORKSPACE='dev'
#terraform plan/apply/destroy --var-file aplha-dev.tfvars --auto-approve