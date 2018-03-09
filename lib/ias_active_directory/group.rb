# frozen_string_literal: true

require 'ias_active_directory/attributes'

# IasActiveDirectory namespace
module IasActiveDirectory
  # ActiveDirectory Group Object
  class Group < Base
    include Member

    def self.filter # :nodoc:
      Net::LDAP::Filter.eq(:objectClass, 'group')
    end

    def self.required_attributes # :nodoc:
      { objectClass: %w[top group] }
    end

    def reload # :nodoc:
      @member_users_non_r  = nil
      @member_users_r      = nil
      @member_groups_non_r = nil
      @member_groups_r     = nil
      @groups              = nil
      super
    end

    # Returns true if the passed User or Group object belongs to
    # this group. For performance reasons, the check is handled
    # by the User or Group object passed.
    def member?(user)
      user.member?(self)
    end

    # Returns an array of all User objects that belong to this group.
    #
    # If the recursive argument is passed as false, then only Users who
    # belong explicitly to this Group are returned.
    #
    # If the recursive argument is passed as true, then all Users who
    # belong to this Group, or any of its subgroups, are returned.
    def member_users(recursive = false)
      @member_users = User.find(:all, distinguishedname: @entry[:member]).delete_if(&:nil?)
      if recursive
        member_groups.each do |group|
          @member_users.concat(group.member_users(true))
        end
      end
      @member_users
    end

    # Returns an array of all Group objects that belong to this group.
    #
    # If the recursive argument is passed as false, then only Groups that
    # belong explicitly to this Group are returned.
    #
    # If the recursive argument is passed as true, then all Groups that
    # belong to this Group, or any of its subgroups, are returned.
    def member_groups(recursive = false)
      @member_groups ||= Group.find(:all, distinguishedname: @entry[:member]).delete_if(&:nil?)
      if recursive
        member_groups.each do |group|
          @member_groups.concat(group.member_groups(true))
        end
      end
      @member_groups
    end

    # Returns an array of Group objects that this Group belongs to.
    def groups
      return [] if memberOf.nil?
      @groups ||= Group.find(:all, distinguishedname: @entry.memberOf).delete_if(&:nil?)
    end
  end
end
