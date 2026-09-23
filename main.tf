module "wordpress" {
  source        = "./modules/wordpress"
  instance_type = var.instance_type
  ami_id        = var.ami_id
}
