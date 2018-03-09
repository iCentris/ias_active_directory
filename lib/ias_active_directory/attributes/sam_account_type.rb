# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # SAM Account Type constants
  module SamAccountType
    # Domain Object Mask
    DOMAIN_OBJECT             = 0x0

    # Group Object Mask
    GROUP_OBJECT              = 0x10000000

    # Non Security Group Object Mask
    NON_SECURITY_GROUP_OBJECT = 0x10000001

    # Alias Object Mask
    ALIAS_OBJECT              = 0x20000000

    # Non Security Alias object Mask
    NON_SECURITY_ALIAS_OBJECT = 0x20000001

    # User Object Mask
    USER_OBJECT               = 0x30000000

    # Normal User Account Mask
    NORMAL_USER_ACCOUNT       = 0x30000000

    # Machine Account Mask
    MACHINE_ACCOUNT           = 0x30000001

    # Trust Account Mask
    TRUST_ACCOUNT             = 0x30000002

    # App Basic Group Mask
    APP_BASIC_GROUP           = 0x40000000

    # App Query Group Mask
    APP_QUERY_GROUP           = 0x40000001

    # Account Type Max Mask
    ACCOUNT_TYPE_MAX          = 0x7fffffff
  end
end
