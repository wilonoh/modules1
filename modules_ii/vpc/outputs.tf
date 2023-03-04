# outputs
output "region" {
    value = var.vpc_region
}

output "project_name" {
    value = var.project_name
}

output "vpc_id" {
    value = aws_vpc.modules_ii_vpc.id
}

output "modules_ii_pub_sub1" {
    value = aws_subnet.modules_ii_pub_sub1
}

output "modules_ii_pub_sub2" {
    value = aws_subnet.modules_ii_pub_sub2
}

output "modules_ii_priv_sub1" {
    value = aws_subnet.modules_ii_priv_sub1
}

output "modules_ii_priv_sub2" {
    value = aws_subnet.modules_ii_priv_sub2
}

output "modules_ii_priv_sub3" {
    value = aws_subnet.modules_ii_priv_sub3
}

output "modules_ii_priv_sub4" {
    value = aws_subnet.modules_ii_priv_sub4
}

output "modules_ii_igw" {
    value = aws_internet_gateway.modules_ii_igw
}

output "modules_ii_ngw1" {
    value = aws_nat_gateway.modules_ii_ngw1
}

output "modules_ii_ngw2" {
    value = aws_nat_gateway.modules_ii_ngw2
}

output "modules_ii_vpc_cidr_block" {
    value = var.modules_ii_vpc_cidr_block
}

output "modules_ii_pub_sub1_cidr_block" {
    value = var.modules_ii_pub_sub1_cidr_block
}

output "modules_ii_pub_sub2_cidr_block" {
    value = var.modules_ii_pub_sub2_cidr_block
}

output "modules_ii_priv_sub1_cidr_block" {
    value = var.modules_ii_priv_sub1_cidr_block
}

output "modules_ii_priv_sub2_cidr_block" {
    value = var.modules_ii_priv_sub2_cidr_block
}

output "modules_ii_priv_sub3_cidr_block" {
    value = var.modules_ii_priv_sub3_cidr_block
}

output "modules_ii_priv_sub4_cidr_block" {
    value = var.modules_ii_priv_sub4_cidr_block
}

output "modules_ii_pub_sub1_availability_zone" {
    value = var.modules_ii_pub_sub1_availability_zone
}

output "modules_ii_pub_sub2_availability_zone" {
    value = var.modules_ii_pub_sub2_availability_zone
}

output "modules_ii_priv_sub1_availability_zone" {
    value = var.modules_ii_priv_sub1_availability_zone
}

output "modules_ii_priv_sub2_availability_zone" {
    value = var.modules_ii_priv_sub2_availability_zone
}

output "modules_ii_priv_sub3_availability_zone" {
    value = var.modules_ii_priv_sub3_availability_zone
}

output "modules_ii_priv_sub4_availability_zone" {
    value = var.modules_ii_priv_sub4_availability_zone
}

output "modules_ii_pub_rt_cidr_block" {
    value = var.modules_ii_pub_rt_cidr_block
}

output "modules_ii_priv_rt1_cidr_block" {
    value = var.modules_ii_priv_rt1_cidr_block
}

output "modules_ii_priv_rt2_cidr_block" {
    value = var.modules_ii_priv_rt2_cidr_block
}