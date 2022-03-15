# --- sqs/outputs.tf ---

# output "sqs_queue_name" {
#   description = "The name of the SQS queue"
#   value       = [for i in data.aws_arn.this : i.resource]
# }

# output "id" {
#   value       = [for i in aws_sqs_queue.default : i.id]
#   description = "The URL for the created Amazon SQS queue."
# }

# output "arn" {
#   value       = [for i in aws_sqs_queue.default : i.arn]
#   description = "The ARN of the SQS queue."
# }

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = data.aws_arn.this.resource
}

output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue."
  value       = aws_sqs_queue.default.id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue."
  value       = aws_sqs_queue.default.arn
}


