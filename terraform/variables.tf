variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "common_tags" {
    default = {
      Project = "Roboshop"
      Component ="catalogue"
      Environment = "DEV"
      terraform = "true"
    }
}

variable "domain_name" {
  default = "nowheretobefound.online"
}

variable "app_version" {
  default = "100.100.100"
}