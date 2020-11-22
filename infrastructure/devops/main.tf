locals {
  project = random_pet.fido.id

  tags = {
    Environment = "Test"
  }
}

resource "random_pet" "fido" {}