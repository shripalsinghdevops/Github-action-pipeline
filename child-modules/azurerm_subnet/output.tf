output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.example : k => v.id
  }
}