# Terraform Repo For AWS B74 Batch

## Class-1
```
Terraform Resource Creation Syntax
resource <type-of-resource> <name-of-resource> {
    argument1 = ?
    argument2 = ?
}
Example:
resource "aws_vpc" "demovpc1" {
    cidr_block = "10.1.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "demovpc1"
    }
}
```

Terraform Implicit Dependency
Terraform Explicit Dependency

### Credentials For Terraform
```
# For Powershell
$Env:AWS_ACCESS_KEY_ID=''
$Env:AWS_SECRET_ACCESS_KEY=''
$Env:AWS_DEFAULT_REGION=''

# For Bash Shell
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
export AWS_DEFAULT_REGION=''
```

### Terraform workfloww commands
```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform apply --auto-approve
terraform state list
terraform state show aws_vpc.awsb74_vpc_1
terraform destroy -target aws_s3_bucket.awsb74demobucket01 --auto-approve
terraform destroy
terraform destroy --auto-approve


## Class-2
1. Variables and tfvars
2. Terraform Functions
   - contains(list, value)
   - count()
   - element(list,index)
   - length
3. Multiple tfvar files
4. Data Sources

## Class-3
1. Lifecycle meta Arguments
   - depends_on
   - prevent_destroy
   - create_before_destroy
   - ignore_changes
2. Importing Resoruces In To Terraform State
3. Renaming Resource in Terraform State.
4. Deleting resources from Terraform State.
5. Dynamic Blocks With Foreach.
5. Functions Continued.
