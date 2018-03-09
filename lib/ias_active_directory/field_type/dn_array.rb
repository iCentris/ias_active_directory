# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # FieldType Namespace
  module FieldType
    # DN Array Field Type
    class DnArray
      # Encodes an array of objects into a list of dns
      def self.encode(obj_array)
        obj_array.collect(&:dn)
      end

      # Decodes a list of DNs into the objects that they are
      def self.decode(dn_array)
        # How to do user or group?
        Base.find(:all, distinguishedname: dn_array)
      end
    end
  end
end
