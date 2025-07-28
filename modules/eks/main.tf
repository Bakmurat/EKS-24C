# ======================= EKS Cluster IAM Roles ========================

resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-eks-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-eks-cluster-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "worker-nodes-role" {
  name = "${var.project_name}-worker-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-worker-nodes-role"
  }
}

resource "aws_iam_role_policy_attachment" "worker_nodes_policy" {
  role       = aws_iam_role.worker-nodes-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.worker-nodes-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  role       = aws_iam_role.worker-nodes-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "worker_nodes_profile" {
  name = "${var.project_name}-worker-nodes-profile"
  role = aws_iam_role.worker-nodes-role.name
}

# ======================= EKS Cluster Security Group ========================
resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.project_name}-eks-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_ingress" "allow_all_ingress_control" {
  security_group_id = aws_security_group.eks_cluster_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol        = "-1"
}
resource "aws_security_group_egress" "allow_all_egress_control" {
  security_group_id = aws_security_group.eks_cluster_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol        = "-1"
}

resource "aws_security_group" "worker-sg" {
  name        = "${var.project_name}-worker-nodes-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_ingress" "allow_all_ingress_worker" {
  security_group_id = aws_security_group.worker-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol        = "-1"
}

resource "aws_security_group_egress" "allow_all_egress_worker" {
  security_group_id = aws_security_group.worker-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol        = "-1"
}