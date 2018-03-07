# frozen_string_literal: true

# IasActiveDirectory Namespace
module IasActiveDirectory
  # @!attribute revision
  #  Revision Number
  # @!attribute dashes
  #  Dashes number
  # @!attribute nt_authority
  #  NT Authority
  # @!attribute nt_non_unique
  #  NT Non Unique
  # @!attribute uuids
  #  Array of UUIDS
  # Create a SID from the binary string in the directory
  class SID < BinData::Record
    endian :little
    uint8 :revision
    uint8 :dashes
    uint48be :nt_authority
    uint32 :nt_non_unique
    array :uuids, type: :uint32, initial_length: -> { dashes - 1 }

    # String representation of the SID
    def to_s
      ['S', revision, nt_authority, nt_non_unique, uuids].join('-')
    end
  end
end
