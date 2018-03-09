# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::IasActiveDirectory::FieldType::Date do
  describe 'concerning .encode' do
    it 'can encode' do
      time = Time.now
      expect(described_class.encode(time)).to eq(time.strftime('%Y%m%d%H%M%S.0Z'))
    end
  end

  describe 'concerning .decode' do
    it 'can decode' do
      expect(described_class.decode('20170920132127.0Z')).to eq(Time.parse('20170920132127.0Z'))
    end
  end
end
