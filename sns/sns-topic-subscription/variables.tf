variable "endpoint" {
    type = string
}

variable "protocol" {
    type = string
}
variable "topic_arn" {
    type = string
}

variable "filter_policy" {
    type = string
    default = null
}