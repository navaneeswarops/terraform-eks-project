module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.13.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {

    workers = {

      desired_size = 2
      min_size     = 2
      max_size     = 3

      instance_types = ["t3.medium"]

      capacity_type = "ON_DEMAND"
    }
  }
}