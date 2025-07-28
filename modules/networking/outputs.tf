output "fp-vpc-id" {
  value = aws_vpc.main.id
}

output "fb-pub-subnet-ids" {
  value = aws_subnet.public.*.id
}

output "fb-priv-subnet-ids" {
  value = aws_subnet.private.*.id
}