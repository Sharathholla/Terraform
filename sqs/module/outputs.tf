output "sqs_dlq_queue_arn" {
    value = aws_sqs_queue.sqs_queue.arn
}