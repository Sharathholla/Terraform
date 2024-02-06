resource "aws_sqs_queue" "sqs_queue" {
  name                      = var.name
  content_based_deduplication = var.content_based_deduplication
  deduplication_scope   = var.fifo_queue == true ? var.deduplication_scope : null
  delay_seconds             = var.delay
  fifo_queue                  = var.fifo_queue
  fifo_throughput_limit = var.fifo_queue == true ? var.throughput : null
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention
  visibility_timeout_seconds = var.visibility_timeout_seconds
  receive_wait_time_seconds = var.receive_wait_time
  policy = var.sqs_policy
  redrive_allow_policy = var.redrive_allow_policy
  redrive_policy = var.redrive_policy
  tags = {
    Used_by = "var.tags"
  }  
}