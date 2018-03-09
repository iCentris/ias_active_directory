# frozen_string_literal: true

require 'ias_active_directory/version'

# External Gem Dependencies
require 'net/ldap'
require 'bindata'
require 'time'

require 'ias_active_directory/sid'
require 'ias_active_directory/base'
require 'ias_active_directory/container'
require 'ias_active_directory/member'
require 'ias_active_directory/user'
require 'ias_active_directory/group'

# Include all our specified field types
%w[
  password
  binary
  date
  timestamp
  dn_array
  user_dn_array
  group_dn_array
  member_dn_array
].each do |field_type|
  require "ias_active_directory/field_type/#{field_type}"
end

# ==================================================================================================
# Monkey Patches
# ==================================================================================================
Net::LDAP::Entry.class_eval do
  # If you ever see a value that is contained in this array, is is Binary, so auto decode it for us.
  def []=(name, value)
    @myhash[self.class.attribute_name(name)] =
      if ::IasActiveDirectory.known_binary_fields.include?(name.downcase.to_sym)
        [value.first.unpack('H*').first.to_s]
      else
        Kernel::Array(value)
      end
  end
end
# ==================================================================================================

# IasActiveDirectory namespace
# @!attribute special_fields
#   A hash of the fields in ActiveDirectory that need to be handled as special cases
# @!attribute known_binary_fields
#   An array of the known special_fields which are of the Binary type
module IasActiveDirectory
  class << self
    attr_accessor :special_fields, :known_binary_fields
  end

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

  # Returns all the special fields that are marked as Binary
  def self.known_binary_fields
    @known_binary_fields ||= @special_fields.values.flat_map { |k| k.select { |_p, q| q == :Binary }.keys }.uniq.sort
  end
end
