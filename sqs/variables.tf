# --- sqs/variables.tf ---

variable "sqs_name" {
  type        = string
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
}

# variable "policy_enabled" {
#   type        = bool
#   default     = false
#   description = "Whether to create SQS Policy."
# }

variable "visibility_timeout_seconds" {
  type        = number
  default     = 30
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)."
}

variable "message_retention_seconds" {
  type        = number
  default     = 345600
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)."
}

variable "max_message_size" {
  type        = number
  default     = 262144
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)."
}

variable "delay_seconds" {
  type        = number
  default     = 0
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)."
}

variable "receive_wait_time_seconds" {
  type        = number
  default     = 0
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)."
}

variable "policy" {
  type        = string
  default     = null
  description = "The JSON policy for the SQS queue."
}

variable "redrive_policy" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (\"5\")."
}

variable "redrive_allow_policy" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The JSON policy to set up the Dead Letter Queue redrive permission"
}

variable "fifo_queue" {
  type        = bool
  default     = false
  description = "Boolean designating a FIFO queue."
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  default     = 300
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours)."
}

variable "deduplication_scope" {
  description = "Specifies whether message deduplication occurs at the message group or queue level. Valid values are messageGroup and queue (default)."
  type        = string
  default     = null
}

variable "fifo_throughput_limit" {
  description = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are perQueue (default) and perMessageGroupId."
  type        = string
  default     = null
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`Environment`,`Production`)."
}