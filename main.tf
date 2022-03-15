# --- root/main.tf ---

data "aws_caller_identity" "current" {}

module "sqs_queue" {
  source         = "./sqs/"
  sqs_name       = "standard-queue"
  redrive_policy = templatefile("${path.root}/redrive_policy.json", {
    dlq_arn = module.dlq.sqs_queue_arn
  })

  tags = {
    Environment = "Production"
  }
}

module "dlq" {
  source   = "./sqs/"
  sqs_name = "dead-letter-queue"
}

resource "aws_sqs_queue_policy" "standard_queue_policy" {
  queue_url = module.sqs_queue.sqs_queue_id
  policy = templatefile("${path.root}/sqs_queue_policy.json", {
    account_arn =  data.aws_caller_identity.current.arn
    sqs_arn  = module.sqs_queue.sqs_queue_arn
  })
}
