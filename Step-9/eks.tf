# provider "aws" {
#   region = local.region
# }

# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1alpha1"
#     command     = "aws"
#     args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
#   }
# }

# locals {
#   name   = "devops-project"
#   region = "eu-central-1"

#   tags = {
#     Example    = local.name
#     GithubRepo = "canerdogan07"
#     GithubOrg  = "canerdogan07"
#   }
# }

# module "eks" {
#   source = "../.."

#   cluster_name                    = local.name
#   cluster_endpoint_private_access = true
#   cluster_endpoint_public_access  = true

#   cluster_addons = {
#     coredns = {
#       resolve_conflicts = "OVERWRITE"
#     }
#     kube-proxy = {}
#     vpc-cni = {
#       resolve_conflicts = "OVERWRITE"
#     }
#   }

#   cluster_encryption_config = [{
#     provider_key_arn = aws_kms_key.eks.arn
#     resources        = ["secrets"]
#   }]

#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   cluster_security_group_additional_rules = {
#     egress_nodes_ephemeral_ports_tcp = {
#       description                = "To node 1025-65535"
#       protocol                   = "tcp"
#       from_port                  = 1025
#       to_port                    = 65535
#       type                       = "egress"
#       source_node_security_group = true
#     }
#   }

#   node_security_group_additional_rules = {
#     ingress_self_all = {
#       description = "Node to node all ports/protocols"
#       protocol    = "-1"
#       from_port   = 0
#       to_port     = 0
#       type        = "ingress"
#       self        = true
#     }
#     egress_all = {
#       description      = "Node all egress"
#       protocol         = "-1"
#       from_port        = 0
#       to_port          = 0
#       type             = "egress"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#     }
#   }
#   self_managed_node_group_defaults = {
#   }

#   eks_managed_node_group_defaults = {
#     ami_type       = "AL2_x86_64"
#     instance_types = ["t2.large"]

#     attach_cluster_primary_security_group = true
#     vpc_security_group_ids                = [aws_security_group.additional.id]
#   }

#   eks_managed_node_groups = {
#     blue = {}
#     green = {
#       min_size     = 1
#       max_size     = 10
#       desired_size = 1

#       instance_types = ["t2.large"]
#       capacity_type  = "SPOT"
#       labels = {
#         Environment = "demo"
#         GithubRepo  = "canerdogan07"
#         GithubOrg   = "canerdogan07"
#       }

#       taints = {
#         dedicated = {
#           key    = "dedicated"
#           value  = "gpuGroup"
#           effect = "NO_SCHEDULE"
#         }
#       }

#       update_config = {
#         max_unavailable_percentage = 50
#       }

#       tags = {
#         ExtraTag = "example"
#       }
#     }
#   }

  
#   fargate_profiles = {
#     default = {
#   }
#   }

#   manage_aws_auth_configmap = true

#   aws_auth_roles = [
#     {
#       rolearn  = "arn:aws:iam::${AWS_ACCOUNT_ID}:role/EKS-Managed-Node-Group-Role"
#       username = "role1"
#       groups   = ["system:masters"]
#     },
#   ]

#   aws_auth_users = [
#     {
#       userarn  = "arn:aws:iam::${AWS_ACCOUNT_ID}:user/Adminstrator"
#       username = "Adminstrator"
#       groups   = ["system:Creators"]
#     },
#     {
#       userarn  = "arn:aws:iam::${AWS_ACCOUNT_ID}user/root"
#       username = "root"
#       groups   = ["system:Creators"]
#     },
#   ]

#   aws_auth_accounts = [
#     "${AWS_ACCOUNT_ID}",
#   ]

#   tags = local.tags
# }

# module "eks_managed_node_group" {
#   source = "../../modules/eks-managed-node-group"

#   name            = "separate-eks-mng"
#   cluster_name    = module.eks.cluster_id
#   cluster_version = module.eks.cluster_version

#   vpc_id                            = module.vpc.vpc_id
#   subnet_ids                        = module.vpc.private_subnets
#   cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
#   vpc_security_group_ids = [
#     module.eks.cluster_security_group_id,
#   ]

#   tags = merge(local.tags, { Separate = "eks-managed-node-group" })
# }
# ################################################################################
# # Disabled creation
# ################################################################################

# module "disabled_eks" {
#   source = "../.."

#   create = false
# }

# module "disabled_fargate_profile" {
#   source = "../../modules/fargate-profile"

#   create = true
# }

# module "disabled_eks_managed_node_group" {
#   source = "../../modules/eks-managed-node-group"

#   create = false
# }

# module "disabled_self_managed_node_group" {
#   source = "../../modules/self-managed-node-group"

#   create = true
# }

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "~> 3.0"

#   name = local.name
#   cidr = "10.0.0.0/16"

#   azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

#   enable_nat_gateway   = true
#   single_nat_gateway   = true
#   enable_dns_hostnames = true

#   enable_flow_log                      = true
#   create_flow_log_cloudwatch_iam_role  = true
#   create_flow_log_cloudwatch_log_group = true

#   public_subnet_tags = {
#     "kubernetes.io/cluster/${local.name}" = "shared"
#     "kubernetes.io/role/elb"              = 1
#   }

#   private_subnet_tags = {
#     "kubernetes.io/cluster/${local.name}" = "shared"
#     "kubernetes.io/role/internal-elb"     = 1
#   }

#   tags = local.tags
# }

# resource "aws_security_group" "additional" {
#   name_prefix = "${local.name}-additional"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"
#     cidr_blocks = [
#       "10.0.0.0/8",
#       "172.16.0.0/12",
#       "192.168.0.0/16",
#     ]
#   }

#   tags = local.tags
# }

# resource "aws_kms_key" "eks" {
#   description             = "EKS Secret Encryption Key"
#   deletion_window_in_days = 7
#   enable_key_rotation     = true

#   tags = local.tags
# }