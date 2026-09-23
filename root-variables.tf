variable "instance_type" {
  description = "The type of instance to use for the WordPress server"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the WordPress server"
  type        = string
  default     =  "ami-07524133e69bdba59"
  }

