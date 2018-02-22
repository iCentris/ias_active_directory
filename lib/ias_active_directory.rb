# frozen_string_literal: true

require 'ias_active_directory/version'

# External Gem Dependencies
require 'net/ldap'

# IasActiveDirectory namespace
# @!attribute special_fields
#   A hash of the fields in ActiveDirectory that need to be handled as special cases
module IasActiveDirectory
  # Return the special fields module variable
  def self.special_fields
    @special_fields
  end

  # @param new_fields [Hash] Set the special fields attribute to the value of new_fields
  def self.special_fields=(new_fields = {})
    @special_fields = new_fields
  end

  # Default our special fields
  self.special_fields = {
    # All objects in the AD
    Base: {
      objectguid: :Binary,
      whencreated: :Date,
      whenchanged: :Date,
      memberof: :DnArray
    },

    # User objects
    User: {
      objectguid: :Binary,
      objectsid: :Binary,
      msexchmailboxguid: :Binary,
      msexchmailboxsecuritydescriptor: :Binary,
      whencreated: :Date,
      whenchanged: :Date,
      lastlogontimestamp: :Timestamp,
      pwdlastset: :Timestamp,
      accountexpires: :Timestamp,
      memberof: :MemberDnArray
    },

    # Group objects
    Group: {
      objectguid: :Binary,
      objectsid: :Binary,
      whencreate: :Date,
      whenchanged: :Date,
      memberof: :GroupDnArray,
      member: :MemberDnArray
    },

    # Computer objects
    Computer: {
      objectguid: :Binary,
      objectsid: :Binary,
      whencreated: :Date,
      whenchanged: :Date,
      memberof: :GroupDnArray,
      member: :MemberDnArray
    }
  }
end
