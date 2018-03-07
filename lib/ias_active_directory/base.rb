# frozen_string_literal: true

# IasActiveDirectory Namespace
module IasActiveDirectory
  # Base ancestor for AD Objects
  # @!attribute ldap
  #   The LDAP Connection object
  # @!attribute ldap_connected
  #   Determines if LDAP is connected
  # @!attribute caching
  #   Determines if caching is enabled
  # @!attribute cache
  #   The cache store, if enabled.
  class Base
    class << self
      attr_accessor :ldap, :ldap_connected, :caching, :cache
    end
    #
    # A Net::LDAP::Filter object that doesn't do any filtering
    # (outside of check that the CN attribute is present.  This
    # is used internally for specifying a 'no filter' condition
    # for methods that require a filter object.
    #
    NIL_FILTER = Net::LDAP::Filter.pres('cn')

    # TODO: Port missing parts here
    @ldap           = nil
    @ldap_connected = false
    @caching        = false
    @cache          = {}
  end
end
