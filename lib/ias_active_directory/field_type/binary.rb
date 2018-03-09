# frozen_string_literal: true

# IasActiveDirectory namespace
module IasActiveDirectory
  # FieldType Namespace
  module FieldType
    # Binary Field Type
    class Binary
      # Encodes a hex string into a GUID
      def self.encode(hex_string)
        [hex_string].pack('H*')
      end

      # Decodes a binary GUID as a hex string
      def self.decode(guid)
        guid.unpack('H*').first.to_s
      end
    end
  end
end
