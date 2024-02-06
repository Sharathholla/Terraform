resource "aws_sns_topic" "sns_topic" {
    name = var.name
    delivery_policy = <<EOF
    {
        "${var.protocol}": {
            "defaultHealthyRetryPolicy": {
                "minDelayTarget": ${var.min_delay_target},
                "maxDelayTarget": ${var.max_delay_target},
                "numRetries": ${var.number_of_retry},
                "numMaxDelayRetries": ${var.max_delay_retry},
                "numNoDelayRetries": ${var.no_delay_retry},
                "numMinDelayRetries": ${var.min_delay_retry},
                "backoffFunction": "${var.backoff_function}"
            },
            "disableSubscriptionOverrides": ${var.subscription_overrides}
        }
    }
    EOF
    tags = {
    Used_By = "var.tags"
  }
}