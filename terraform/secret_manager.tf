resource "aws_secretsmanager_secret" "k8s_master_ssh_secret" {
  name        = "k8s-master-ssh-key"
  description = "SSH key for the Kubernetes master node"
}

resource "aws_secretsmanager_secret_version" "k8s_master_ssh_secret_version" {
  secret_id     = aws_secretsmanager_secret.k8s_master_ssh_secret.id
  secret_string = tls_private_key.k8s_master_key.private_key_pem
}

# Not relevant anymore bc k3s
# resource "aws_secretsmanager_secret" "k8s_worker_ssh_secret" {
#   name        = "k8s-worker-ssh-key"
#   description = "SSH key for the Kubernetes worker node"
# }

# resource "aws_secretsmanager_secret_version" "k8s_worker_ssh_secret_version" {
#   secret_id     = aws_secretsmanager_secret.k8s_worker_ssh_secret.id
#   secret_string = tls_private_key.k8s_worker_key.private_key_pem
# }