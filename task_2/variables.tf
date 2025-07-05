variable "region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "my_ip" {
  description = "Your public IP"
  type        = string
}
