terraform {
  # This is enabled to use validation in variable
  experiments = [variable_validation]
}

variable "stage" {
    description = "Stage on which infra should be deployed"
    type = string
    validation {
        condition = can(regex("latest|test|beta|prod", var.stage))
        error_message = "Invalid stage! Allowed values are [latest, test, beta, prod]."
    }
}

variable "tenant" {
    type    = string
    default = "platform"
}

variable "feature" {
    type = string
}

variable "service" {
    type = string
}
