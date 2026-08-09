rgs = {

  rg1 = {

    name     = "shri1"
    location = "westus"
  }
}

vnet = {
  vnet1 = {
    name                = "vnet"
    resource_group_name = "shri1"
    location            = "westus"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "frontend"
    resource_group_name  = "shri1"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }
  subnet2 = {
    name                 = "backend"
    resource_group_name  = "shri1"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "shri1"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.3.0/26"]

  }
}
pubip = {

  pubip1 = {
    name                = "bastionpubip"
    location            = "westus"
    resource_group_name = "shri1"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

bastion = {
  bastion1 = {

    name                = "bastion_host"
    location            = "westus"
    resource_group_name = "shri1"

  }
}
