provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "/home/ec2-user/.aws/credentials" 
}

terraform {
  backend "s3" {
    bucket="sharath-terraform-statefiles"
    key = "SNS"
    region="us-east-2"
  }
}
locals {
    sns_topic = csvdecode(file("./sns-topic-variables.csv"))
    sns_subscription = csvdecode(file("./sns-subscription-variables.csv"))
}

module "sns_topic" {
  source = "./sns-topic"
  for_each = {for topic in local.sns_topic : topic.topic_name => topic }
  backoff_function = each.value.back_off_function
  max_delay_retry = tonumber(each.value.max_delay_retries)
  max_delay_target = tonumber(each.value.max_delay_target)
  min_delay_retry = tonumber(each.value.min_delay_retries)
  min_delay_target = tonumber(each.value.min_delay_target)
  name = each.value.topic_name
  no_delay_retry = tonumber(each.value.no_delay_retry)
  number_of_retry = tonumber(each.value.number_of_retries)
  protocol = each.value.delivery_policy_protocol
  tags = each.value.tags
  subscription_overrides = tobool(each.value.disable_subscription_override)
}

module "sns_topic_subscription" {
  depends_on = [module.sns_topic]
  source = "./sns-topic-subscription"
  for_each = {for id in local.sns_subscription : id.serial_id => id }
  endpoint = each.value.endpoint
  protocol = each.value.protocol
  topic_arn = module.sns_topic[each.value.topic_name].sns_topic_arn
}