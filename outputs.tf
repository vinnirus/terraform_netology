output "instance_user_id" {
  value = data.aws_caller_identity.current.user_id
}

output "instance_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "instance_private_ip_addr" {
  value = aws_instance.my_aws_ubuntu.private_ip
}

output "instance_network" {
  value = aws_instance.my_aws_ubuntu.network_interface
}

output "instance_region" {
  value = data.aws_region.current.name
}