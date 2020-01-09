resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }

  byte_length = 6
}

data "terraform_remote_state" "bubbles" {
  backend = "remote"
  config = {
    organization = "clang_test"
    workspaces = {
      name = "bubbles"
    }
  }
}

output "random" {
  value = "Buttercup output: ${random_id.random.hex}"
}

output "bubbles_random" {
  value = "Bubbles Remote Value - ${data.terraform_remote_state.bubbles.random}
}

output "blossom_random" {
  value = "Blossom Remote Value thru Bubbles- ${data.terraform_remote_state.bubbles.blossom_random}
}