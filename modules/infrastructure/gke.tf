resource "google_container_cluster" "factory" {
  project                     = var.project
  name                        = var.name
  location                    = var.zone
  network                     = google_compute_network.factory.id
  initial_node_count          = 1
  enable_intranode_visibility = true
  networking_mode             = "VPC_NATIVE"
  datapath_provider           = "ADVANCED_DATAPATH"
  remove_default_node_pool    = true
  resource_labels = {
    mesh_id = "proj-${data.google_project.factory.number}"
  }
  release_channel {
    channel = "REGULAR"
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }
  vertical_pod_autoscaling {
    enabled = true
  }
  ip_allocation_policy {}
}

resource "google_container_node_pool" "factory" {
  name       = "nodepool-1"
  cluster    = google_container_cluster.factory.id
  node_count = 4
  node_config {
    machine_type = "e2-highcpu-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}

resource "google_gke_hub_membership" "factory" {
  project       = var.project
  membership_id = var.name
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${google_container_cluster.factory.id}"
    }
  }
  provider = google-beta
}

resource "google_gke_hub_feature" "configmanagement" {
  project  = var.project
  name     = "configmanagement"
  location = "global"
  provider = google-beta
}

resource "google_gke_hub_feature" "mesh" {
  project  = var.project
  name     = "servicemesh"
  location = "global"
  provider = google-beta
}

resource "google_gke_hub_feature_membership" "factory_config_management" {
  project    = var.project
  location   = "global"
  feature    = google_gke_hub_feature.configmanagement.name
  membership = google_gke_hub_membership.factory.membership_id
  configmanagement {
    version = "1.13.0"
    config_sync {
      git {
        sync_repo      = var.sync.repository
        sync_wait_secs = 5
        secret_type    = "ssh"
        sync_branch    = var.sync.branch
        policy_dir     = var.sync.dir
      }
      source_format = "unstructured"
    }
  }
  provider = google-beta
}
