output "environment_lab" {
  value = ["${vsphere_tag.lab.id}"]
}
output "environment_dev" {
  value = ["${vsphere_tag.dev.id}"]
}
output "environment_stage" {
  value = ["${vsphere_tag.stage.id}"]
}
output "environment_prod" {
  value = ["${vsphere_tag.prod.id}"]
}
output "team_network" {
  value = ["${vsphere_tag.network.id}"]
}
output "team_dba" {
  value = ["${vsphere_tag.dba.id}"]
}
output "team_developer" {
  value = ["${vsphere_tag.developer.id}"]
}
output "team_storage" {
  value = ["${vsphere_tag.storage.id}"]
}
output "app_sap" {
  value = ["${vsphere_tag.sap.id}"]
}
output "app_sql" {
  value = ["${vsphere_tag.sql.id}"]
}
output "app_java" {
  value = ["${vsphere_tag.java.id}"]
}
output "app_nodejs" {
  value = ["${vsphere_tag.nodejs.id}"]
}