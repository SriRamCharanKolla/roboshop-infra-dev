variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

# variable "zone_id" { # AWS R53 hosted zone ID
#   default = "Z082192717Y56TLJLLOXS"
# }

# variable "domain_name" {
#   default = "aitechapp.fun"
# }

variable "zone_id" { # AWS R53 hosted zone ID
  default = "Z060859227V3ZMMILEZ24"
}

variable "domain_name" {
  default = "ramcharankola.in"
}

variable "app_version" {
  default = "v3"
}