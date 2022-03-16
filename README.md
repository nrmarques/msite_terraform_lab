# NDO Terraform Lab

ACI multi-site network with shared networking capabilities. 

Consists of four modules:
- deploy - deploys schema and templates to sites
- schema - schema design
- intersite_template - shared resources template 
- site_template - site specific template 

You need to initialize terraform so it makes sure all the correct resources are avaialble. If the resource is not available, Terraform will download it.

terraform init 

You should see
Terraform has been successfully initialized!

Terraform plan is used for change management and lets the user know what will be configured:

terraform plan -parallelism=1

Terraform plan will apply the changes:

terraform apply -parallelism=1	

You will see a list of all the resources which are to be created, modified or destroyed

Please enter yes


# nmarques
