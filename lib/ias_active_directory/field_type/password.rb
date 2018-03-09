# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # FieldType Namespace
  module FieldType
    # Password Field Type
    class Password
      # Encodes an unencrypted password into an encrypted password
      # that the Active Directory server will understand.
      def self.encode(password)
        ("\"#{password}\"".split(//).collect { |c| "#{c}\000" }).join
      end

      # Always returns nil, since you can't decrypt the User's encrypted
      # password.
      def self.decode(_hashed)
        nil
      end
    end
  end
end
