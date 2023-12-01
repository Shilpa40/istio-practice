variable "aws-region" {
  type = string
}

variable "shared_credentials_file_path" {
  type = string
}

variable "aws-profile" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "asg_max_size" {
  type = number
}

variable "instance_type" {
  type = string

}

variable "map_users" {
  type = list(object({
    userarn  = string
    username = string
  }))
}
