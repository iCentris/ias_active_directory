# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # Group Type Constants
  module GroupType
    # Local Group Mask
    BUILTIN_LOCAL_GROUP = 0x00000001

    # Account Group Mask
    ACCOUNT_GROUP       = 0x00000002

    # Resource Group Mask
    RESSOURCE_GROUP     = 0x00000004

    # Universal Group Mask
    UNIVERSAL_GROUP     = 0x00000008

    # App Basic Group Mask
    APP_BASIC_GROUP     = 0x00000010

    # App Query Group Mask
    APP_QUERY_GROUP     = 0x00000020

    # Security Enabled Mask
    SECURITY_ENABLED    = 0x80000000
  end
end
