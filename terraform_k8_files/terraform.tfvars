aws-region                   = "us-east-1"
shared_credentials_file_path = "/aws/credentials"

vpc_id        = "vpc-0f1ddf1c35834a283"
cluster_name  = "k8s_cluster_istio"
instance_type = "t3.medium"
asg_max_size  = 1

# we add public subnets to tag it with cluster_name tag
subnets = [
  "private-subnet-a",
  "private-subnet-b",
  "private-subnet-c",
  "public-subnet-a",
  "public-subnet-b",
  "public-subnet-c"
]

map_users = [
  {
    userarn  = "arn:aws:iam::002915788289:user/shilpa"
    username = "shilpa"
  },
]
