module "mongodb_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
  subnet_id = local.private_subnet_id
#   user_data = filebase64("${path.module}/mongodb.sh")
  tags = merge(
    {
        Name = "Catalogue-DEV-AMI"
    },
    var.common_tags
  )
}