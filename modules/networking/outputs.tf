output "fp-vpc-id" {
  value = aws_vpc.fp-vpc.id
}

output "fb-pub-subnet-ids" {
  value = aws_subnet.fp-pub-subnet.*.id
}

output "fb-priv-subnet-ids" {
  value = aws_subnet.fp-priv-subnet.*.id
}