provider "google" {
  credentials = file("porjectg-iti-5b0a7c16d72a.json")
  project     = "porjectg-iti"
  region      = "us-central1"
}

variable "docker_image" {
  description = "Docker image reference"
  default     = "docker.io/gaser98/test-repo"
}

resource "google_cloudbuild_trigger" "docker_build_trigger" {
  name        = "docker-build-trigger"
  description = "Trigger for Docker image build and push"
  project     = "porjectg-iti"
  
  github {
    owner = "Gaser98"
    name  = "App-deployment"
    push {
      branch = "main"
    }
  }

  build {
    timeout = "600s"

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build",
        "-t",
        var.docker_image,
        "."
      ]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "login",
        "-u",
        "docker_username",
        "-p",
        "docker_password",
      ]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "push",
        var.docker_image
      ]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "run",
        "-d",
        "-p",
        "80:80",
        var.docker_image
      ]
    }
  }
}
