provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "null_resource" "install_delegate" {
  provisioner "local-exec" {
    command = <<EOT
      helm repo add harness-delegate https://app.harness.io/storage/harness-download/delegate-helm-chart/
      helm repo update harness-delegate
      helm upgrade -i helm-delegate --namespace harness-delegate-ng --create-namespace \
      harness-delegate/harness-delegate-ng \
      --set delegateName=helm-delegate \
      --set accountId=AOTqsni_TsSZSFPeNjom6A \
      --set delegateToken=ODQ2ZTYyN2Q5MmZjZjdkMWVjMGM0MGQ3NTk4ZTdmMWE= \
      --set managerEndpoint=https://app.harness.io \
      --set delegateDockerImage=us-docker.pkg.dev/gar-prod-setup/harness-public/harness/delegate:25.04.85701 \
      --set replicas=1 --set upgrader.enabled=true
    EOT
  }
}
