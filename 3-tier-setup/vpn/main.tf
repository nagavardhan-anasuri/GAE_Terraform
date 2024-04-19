resource "azurerm_public_ip" "this" {
  name                = var.vpn_pip_name
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.vir_nw_gw
  location            = var.location
  resource_group_name = var.resource_group

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.web_subnet_id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]

    root_certificate {
      name = "RootCertificate"

      data = local.vpn_client_root_cert_content

  }
}
}

resource "tls_private_key" "cm_ca_private_key" {
  algorithm = "RSA"
}
#
resource "local_file" "cloudmanthan_ca_key" {
  content  = tls_private_key.cm_ca_private_key.private_key_pem
  filename = "${path.module}/certs/cloudmanthanCA.key"
}

resource "tls_self_signed_cert" "cm_ca_cert" {
  private_key_pem = tls_private_key.cm_ca_private_key.private_key_pem

  is_ca_certificate = true

  subject {
    country             = "IN"
    province            = "Mahrashatra"
    locality            = "Mumbai"
    common_name         = "Cloud Manthan Root CA"
    organization        = "Cloud Manthan Software Solutions Pvt Ltd."
    organizational_unit = "Cloud Manthan Root Certification Auhtority"
  }

  validity_period_hours = 43800 //  1825 days or 5 years

  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
    "client_auth",
    "server_auth",
  ]
}

resource "local_file" "cloudmanthan_ca_cert" {
  content  = tls_self_signed_cert.cm_ca_cert.cert_pem
  filename = "${path.module}/certs/cloudmanthanCA.cert"
}

locals {
  vpn_client_root_cert_content = file("${path.module}/certs/cloudmanthanCA.cert")
}