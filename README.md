# terraform-vmware-assets
Repo for VMware vSphere provisioning with Terraform. 
- This repo uses 2 embedded modules: Tags and VM

### Export environment variables for VMware vSphere provider
```
export VSPHERE_USER="<user-name>@vsphere.local"
export VSPHERE_PASSWORD="<password>"
export VSPHERE_SERVER="<vsphere-server-ip>"
```

### Export terraform variables
Create a `terraform.tfvars` file with the required variables. Please see `variables.tf` for all variables.
```
cat <<EOF> terraform.tfvars
project="terraform-demo"
dc_name="useast-vsphere"
EOF
```

### (Optional) Create Terraform Enterprise backend and credential file:
```
export TFE_WORKSPACE="terraform-vsphere-demo"
export TFE_ORG="kawsar-org"
cat <<EOF >./backend.tf
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "${TFE_ORG}"
    workspaces {
      name = "${TFE_WORKSPACE}"
    }
  }
}
EOF

export TFE_TOKEN="${SAAS_TFE_TOKEN}"
export TFE_HOST="app.terraform.io"
cat <<EOF >>~/.terraformrc
credentials "${TFE_HOST}" {
  token = "${TFE_TOKEN}"
}
EOF
```

### Run terraform
```
terraform init
terraform plan
terraform apply
```

### Clean up resources
```
terraform destroy
```