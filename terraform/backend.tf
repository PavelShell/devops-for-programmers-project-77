terraform {
  cloud {
    organization = "PavelShell"

    workspaces {
      name = "example-workspace"
    }
  }
}