variable "TAG" {
  default = "latest"
}

variable "REGISTRY" {
  default = "ghcr.io/dominikrt"
}

group "default" {
    targets = ["default", "mysql"]
}

target "default" {
    dockerfile = "Dockerfile"
    args = {
        VERSION = "1.0.0"
    }
    tags = ["${REGISTRY}/gatecha:${TAG}"]
    platforms = ["linux/amd64"]
}

target "mysql" {
    dockerfile = "Dockerfile"
    args = {
        VERSION = "1.0.0"
        BUILD_TAGS = "mysql"
    }
    tags = ["${REGISTRY}/gatecha:${TAG}-mysql"]
    platforms = ["linux/amd64"]
}
