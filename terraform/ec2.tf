resource "aws_instance" "k8s_master" {
  ami           = var.ami
  instance_type = "t3.medium"

  subnet_id          = aws_subnet.public.id
  vpc_security_group_ids   = [aws_security_group.k8s.id]

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "k8s-master"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install docker
              sudo usermod -a -G docker ec2-user
              id ec2-user
              newgrp docker
              sudo systemctl enable docker.service
              sudo systemctl start docker.service
              curl -sfL https://get.k3s.io | sh -
              kubectl create secret docker-registry ecr-secret --docker-server=537124969991.dkr.ecr.eu-north-1.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password --region eu-north-1) --docker-email=sandbox@lifi.com
              echo KUBECONFIG=/etc/rancher/k3s/k3s.yaml > /etc/environment
              curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
              aws s3 cp s3://lifi-sandbox-script-bucket/bird /home/ec2-user/ --recursive
              aws s3 cp s3://lifi-sandbox-script-bucket/birdImage /home/ec2-user/ --recursive
              EOF
}