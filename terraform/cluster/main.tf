resource "google_container_cluster" "primary" {
  name     = "my-k8s-cluster"
  location = "us-centra1-c"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}
