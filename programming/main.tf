provider "aws" {
  region = "us-east-2"
}

variable "user_names" {
  type = list(string)
  default = ["luffy", "hebihime", "garp"]
}

module "users" {
  source = "../modules/landing-zone/iam-user"
  for_each = toset(var.user_names)
  user_name = each.value
}

variable "custom_tags" {
  type = map(string)
  default = {}
}

# module "users" {
#   source = "../modules/landing-zone/iam-user"
#   count = length(var.user_names)
#   user_name = var.user_names[count.index]
# }

output "user_arns" {
  value = values(module.users)[*].user_arn
}
