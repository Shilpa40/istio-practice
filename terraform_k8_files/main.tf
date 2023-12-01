provider "aws" {
  version                 = ">= 3.0"
  region                  = var.aws-region
  shared_credentials_file = var.shared_credentials_file_path
  profile                 = var.aws-profile
}

provider "kubernetes" {
  version                = ">= 1.9"
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

data "aws_eks_cluster" "cluster" {
  name = module.k8s_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.k8s_cluster.cluster_id
}

module "k8s_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = ">=1.17"
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  worker_groups = [
    {
      instance_type    = var.instance_type
      asg_max_size     = var.asg_max_size
      root_volume_type = "gp2"
    }
  ]
  map_users = var.map_users
}
