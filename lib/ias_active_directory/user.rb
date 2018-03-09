# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # Users in ActiveDirectory
  class User < Base
    include Member

    UAC_ACCOUNT_DISABLED       = 0x0002 # User Account Control Account Disabled Mask
    UAC_NORMAL_ACCOUNT         = 0x0200 # 512
    UAC_PASSWORD_NEVER_EXPIRES = 0x10000 # 65536

    def self.filter # :nodoc:
      Net::LDAP::Filter.eq(:objectClass, 'user') & ~Net::LDAP::Filter.eq(:objectClass, 'computer')
    end

    def self.required_attributes #:nodoc:
      { objectClass: %w[top organizationalPerson person user] }
    end

    # Try to authenticate the current User against Active Directory
    # using the supplied password. Returns false upon failure.
    #
    # Authenticate can fail for a variety of reasons, primarily:
    #
    # * The password is wrong
    # * The account is locked
    # * The account is disabled
    #
    # User#locked? and User#disabled? can be used to identify the
    # latter two cases, and if the account is enabled and unlocked,
    # Athe password is probably invalid.
    def authenticate(password)
      return false if password.to_s.empty?

      @ldap.dup.bind_as(
        filter: "(sAMAccountName=#{sAMAccountName})",
        password: password
      )
    end

    # Returns an array of Group objects that this User belongs to.
    # Only the immediate parent groups are returned, so if the user
    # Sally is in a group called Sales, and Sales is in a group
    # called Marketting, this method would only return the Sales group.
    def groups
      @groups ||= Group.find(:all, distinguishedname: @entry[:memberOf])
    end

    # Returns true if this account has been locked out
    # (usually because of too many invalid authentication attempts).
    #
    # Locked accounts can be unlocked with the User#unlock! method.
    def locked?
      !lockout_time.nil? && lockout_time.to_i != 0
    end

    # Returns true if this account has been disabled.
    def disabled?
      userAccountControl.to_i & UAC_ACCOUNT_DISABLED != 0
    end

    # Returns true if this account is expired.
    def expired?
      !lockout_time.nil? && lockout_time.to_i != 0
    end

    # Returns true if this account has a password that does not expire.
    def password_never_expires?
      userAccountControl.to_i & UAC_PASSWORD_NEVER_EXPIRES != 0
    end

    # Returns true if the user should be able to log in with a correct
    # password (essentially, their account is not disabled or locked
    # out).
    def can_login?
      !disabled? && !locked?
    end

    # This isn't always set in the LDAP entry but we want to default it to something safe.
    def lockout_time
      if valid_attribute? :lockouttime
        get_attr('lockouttime').presence
      else
        '0'
      end
    end
  end
end
