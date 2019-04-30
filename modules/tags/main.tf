// Environment Category
resource "vsphere_tag_category" "environment" {
  name        = "${var.project}-Environment"
  description = "Managed by Terraform"
  cardinality = "MULTIPLE"

  // The types of objects this tag can be associated with.
  associable_types = [
    "VirtualMachine",
    "Folder",
  ]
}

resource "vsphere_tag" "dev" {
  name        = "Development"
  category_id = "${vsphere_tag_category.environment.id}"
  description = "Use for development environments."
}
resource "vsphere_tag" "prod" {
  name        = "Production"
  category_id = "${vsphere_tag_category.environment.id}"
  description = "Use for production environments."
}
resource "vsphere_tag" "stage" {
  name        = "Staging"
  category_id = "${vsphere_tag_category.environment.id}"
  description = "Use for staging environments."
}
resource "vsphere_tag" "lab" {
  name        = "Lab"
  category_id = "${vsphere_tag_category.environment.id}"
  description = "Use for lab environments."
}

// Teams Category
resource "vsphere_tag_category" "teams" {
  name        = "${var.project}-Teams"
  description = "Managed by Terraform"
  cardinality = "MULTIPLE"

  // The types of objects this tag can be associated with.
  associable_types = [
    "VirtualMachine",
    "Folder",
  ]
}
resource "vsphere_tag" "network" {
  name        = "Network Team"
  category_id = "${vsphere_tag_category.teams.id}"
  description = "Created for the Network Team."
}
resource "vsphere_tag" "storage" {
  name        = "Storage Team"
  category_id = "${vsphere_tag_category.teams.id}"
  description = "Created for the Storage Team."
}
resource "vsphere_tag" "dba" {
  name        = "DBA Team"
  category_id = "${vsphere_tag_category.teams.id}"
  description = "Created for the DBA Team"
}
resource "vsphere_tag" "developer" {
  name        = "Development Team"
  category_id = "${vsphere_tag_category.teams.id}"
  description = "Created for the Development Team."
}

// App Category
resource "vsphere_tag_category" "app" {
  name        = "${var.project}-App"
  description = "Managed by Terraform"
  cardinality = "MULTIPLE"

  // The types of objects this tag can be associated with.
  associable_types = [
    "VirtualMachine",
    "Folder",
  ]
}
resource "vsphere_tag" "sap" {
  name        = "SAP"
  category_id = "${vsphere_tag_category.app.id}"
  description = "Created for an SAP Solution."
}
resource "vsphere_tag" "sql" {
  name        = "SQL Server"
  category_id = "${vsphere_tag_category.app.id}"
  description = "Created for a SQL Server Database."
}
resource "vsphere_tag" "java" {
  name        = "Java"
  category_id = "${vsphere_tag_category.app.id}"
  description = "Created for a Java application."
}
resource "vsphere_tag" "nodejs" {
  name        = "Node.js"
  category_id = "${vsphere_tag_category.app.id}"
  description = "Created for a Node.js application."
}