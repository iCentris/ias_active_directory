# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # FieldType Namespace
  module FieldType
    # Member DN Array Field Type
    class MemberDnArray
      # Encodes an array of objects into a list of dns
      def self.encode(obj_array)
        obj_array.collect(&:dn)
      end

      # Decodes a list of DNs into the objects that they are
      def self.decode(dn_array)
        # Ensures that the objects are cast correctly
        users = User.find(:all, distinguishedname: dn_array)
        groups = Group.find(:all, distinguishedname: dn_array)

        arr = []
        arr << users unless users.nil?
        arr << groups unless groups.nil?

        arr.flatten
      end
    end
  end
end
