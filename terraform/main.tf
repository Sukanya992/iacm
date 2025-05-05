provider "google" {
  project = "plated-epigram-452709-h6"
  region  = "us-central1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "cluster" {
  source = "./cluster"
}

module "delegate" {
  source = "./delegate"

  providers = {
    helm = helm
  }

  depends_on = [module.cluster]
}
