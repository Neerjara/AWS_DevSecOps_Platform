module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.16.0"

  cluster_name = "devsecops-cluster"

  kubernetes_version = "1.29"   # 👈 changed name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]

      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }
    }
  }
}
