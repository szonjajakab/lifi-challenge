variable "region" {
  description = "The region in which to create resources."
  type        = string
  default     = "eu-north-1"
}

variable "ami" {
  description = "The latest Ubuntu AMI"
  type        = string
  default     = "ami-0c6da69dd16f45f72"
}