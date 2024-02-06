variable "name" {
    type = string
}

variable "delay" {
    type = number
}

variable "max_message_size" {
    type = number
}

variable "message_retention" {
    type = number
}

variable "visibility_timeout_seconds" {
    type = number
}

variable "receive_wait_time" {
    type = number
}

variable "fifo_queue" {
    type = bool
}

variable "content_based_deduplication" {
    type = bool
    default = false
}

variable "deduplication_scope" {
    type = string
    default = ""
}

variable "throughput" {
    type = string
    default = ""
}

variable "sqs_policy" {
    type = string
}

variable "redrive_allow_policy" {
    type = string
    default = ""
}

variable "redrive_policy" {
    type = string
    default = ""
}

variable "tags" {
    type = string
}