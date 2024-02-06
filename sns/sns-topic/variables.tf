variable "name" {
    type = string
}

variable "tags" {
    type = string
}

variable "protocol" {
    type = string
}

variable "min_delay_target" {
    type = number
}

variable "max_delay_target" {
    type = number
}

variable "number_of_retry" {
    type = number
}

variable "max_delay_retry" {
    type = number
}

variable "no_delay_retry" {
    type = number
}

variable "min_delay_retry" {
    type = number
}

variable "backoff_function" {
    type = string
}

variable "subscription_overrides" {
    type = bool
}
