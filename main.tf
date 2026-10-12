resource "snowflake_user_authentication_policy_attachment" "user_authentication_policy_attachments" {
  for_each = var.user_authentication_policy_attachments

  authentication_policy_name = each.value.authentication_policy_name
  user_name                  = each.value.user_name

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

