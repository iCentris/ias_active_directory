# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # FieldType Namespace
  module FieldType
    # Group DN Array Field Type
    class GroupDnArray
      # Encodes an array of objects into a list of dns
      def self.encode(obj_array)
        obj_array.collect(&:dn)
      end

      # Decodes a list of DNs into the objects that they are
      def self.decode(dn_array)
        # How to do user or group?
        Group.find(:all, distinguishedname: dn_array)
      end
    end
  end
end
