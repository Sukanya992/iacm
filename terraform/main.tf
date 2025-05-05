module "cluster" {
  source = "./cluster"
}

module "delegate" {
  source = "./delegate"

  depends_on = [module.cluster]  # This ensures delegate runs after cluster
}
