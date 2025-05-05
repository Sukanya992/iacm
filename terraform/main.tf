module "cluster" {
  source = "./cluster"
}

module "delegate" {
  source = "./delegate"

  depends_on = [module.cluster] # Ensure delegate installs after cluster
  harness_account_id  = var.harness_account_id
  harness_delegate_token = var.harness_delegate_token
}
