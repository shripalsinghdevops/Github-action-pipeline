module "rgs" {
source = "../child-modules/azurerm_resource_group"
rgs = var.rgs
}

module "vnet" {
source = "../child-modules/azurerm_vnet"
depends_on = [ module.rgs ]
vnet = var.vnet
}

module "subnet" {
source = "../child-modules/azurerm_subnet"
depends_on = [ module.vnet ]

subnet = var.subnet
}

module "pubip" {
    source = "../child-modules/azurerm_pubip"
depends_on = [ module.rgs ]
    pubip = var.pubip
  
}
module "bastion" {

  source = "../child-modules/azurerm_bastion"

  bastion = {
    for k, v in var.bastion : k => merge(
      v,
      {
        subnet_id            = module.subnet.subnet_ids["subnet3"]
        public_ip_address_id = module.pubip.public_ip_ids["pubip1"]
      }
    )
  }

  depends_on = [
    module.subnet,
    module.pubip
  ]
}
