# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # Member module for Users/Groups
  module Member
    # Returns true if this member (User or Group) is a member of
    # the passed Group object.
    def member?(usergroup)
      group_dns = memberOf
      return false if group_dns.nil? || group_dns.empty?
      group_dns.map(&:dn).include?(usergroup.dn)
    end
  end
end
