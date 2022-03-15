# --- sqs/main.tf ---

data "aws_arn" "this" {
  # for_each = toset(var.sqs_name)
  # arn      = aws_sqs_queue.default[each.value].arn
  arn = aws_sqs_queue.default.arn
}

resource "aws_sqs_queue" "default" {
  # count                             = var.enabled ? 1 : 0
  # for_each                          = var.enabled ? toset(var.sqs_name) : []
  name                              = var.fifo_queue == true ? "${var.sqs_name}.fifo" : var.sqs_name
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  policy                            = var.policy
  redrive_policy                    = var.redrive_policy
  redrive_allow_policy              = var.redrive_allow_policy
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  deduplication_scope               = var.deduplication_scope
  fifo_throughput_limit             = var.fifo_throughput_limit
  tags                              = var.tags
}

# resource "aws_sqs_queue_policy" "this" {
#   count = var.enabled ? 1 : 0
#   # for_each  = toset(var.sqs_name)
#   # queue_url = aws_sqs_queue.default[each.value].id
#   queue_url = aws_sqs_queue.default.id

#   policy = templatefile(var.policy_path, {
#     # sqs_arn = data.aws_arn.this[each.value].arn
#     sqs_arn = data.aws_arn.this.arn
#   })
# }