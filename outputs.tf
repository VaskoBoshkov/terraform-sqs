# --- root/outputs.tf ---

output "sqs_id" {
  value       = module.sqs_queue.sqs_queue_id
  description = "The URL for the created Amazon SQS queue."
}

output "sqs_arn" {
  value       = module.sqs_queue.sqs_queue_arn
  description = "The ARN of the SQS queue."
}

output "sqs_name" {
  value       = module.sqs_queue.sqs_queue_name
  description = "The name of the SQS queue"
}

# output "dlq_id" {
#   value       = module.dlq.sqs_queue_id
#   description = "The URL for the created Amazon SQS queue."
# }

# output "dlq_arn" {
#   value       = module.dlq.sqs_queue_arn
#   description = "The ARN of the SQS queue."
# }

# output "dlq_name" {
#   value       = module.dlq.sqs_queue_name
#   description = "The name of the SQS queue"
# }