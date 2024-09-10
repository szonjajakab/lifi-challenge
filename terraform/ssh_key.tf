resource "tls_private_key" "k8s_master_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Not relevant anymore bc k3s
# resource "tls_private_key" "k8s_worker_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }