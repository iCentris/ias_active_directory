# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::IasActiveDirectory::FieldType::Binary do
  describe 'concerning .encode' do
    it 'can encode to string to hex (high nibble first)' do
      expect(described_class.encode('DEADBEEF')).to eq(['DEADBEEF'].pack('H*'))
    end
  end

  describe 'concerning .decode' do
    it 'can decode a hex binary string to normal' do
      expect(described_class.decode('\xDE\xAD\xBE\xEF')).to eq('\xDE\xAD\xBE\xEF'.unpack('H*').first.to_s)
    end
  end
end
