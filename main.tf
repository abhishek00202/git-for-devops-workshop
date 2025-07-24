resource "aws_instance" "web" {
   # for_each    = toset(var.ec2_names)
    count = 2
  ami           = "ami-0623bc4c9a53fe562"
  instance_type = var.env == "prd" ? "t3.small" : "t3.micro"
   key_name     = "Dev-account"
   
   
   
# condtion ? true : false
tags = {
  #name = each.value    applicable for for_each
   name = "dev-${count.index}" or "dev-${count.index +1}"  # it will add +1 index to the name, ex-dev 1,dev2
  Environment = var.env
}

}