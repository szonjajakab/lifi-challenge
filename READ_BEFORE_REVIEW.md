Sidenotes:
My original plan was to use kubeadm, and follow the kubernetes best practises with a 1 master 2 slave setup, but i reverted back to k3s, because this was the ligthweight solution. 

The AWS infrastructure is the following:
- 1 VPC with public subnet
- 1 ec2 kubernetes master node
- 1 security group to allow kubernetes traffic
- SSH keys to access the ec2 instance is generated and stored in secret manager, but for the sake of flexibility, SSM is also enabled
- S3 bucket is created to store a startup script (even though i did not use it in the final solution)
- IAM roles, policy and attachments are created to access S3, ECR and Secret Manager
- ECR is created to store the images for bird and birdImage

Ideally, the vpc setup would be 1 public subnet with a bastion host, and 1 private subnet with the master and slave kubernetes nodes, but I planned on spending 2 working days on this task, this is the result of it.

Dockerfiles:
Multi stage build was utilized to reduce image size and enhance security

Helm charts:
Nothing special to add here, the charts were generated by helm, I just switched the image and the imagepullsecrets
Additionally, i would install bitnami prometheus chart for monitoring.
