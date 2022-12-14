resource "tls_private_key" "factory_config_management" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
