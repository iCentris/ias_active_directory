# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::IasActiveDirectory::GroupType do
  describe 'concerning constants' do
    it 'knows BUILTIN_LOCAL_GROUP' do
      expect(described_class::BUILTIN_LOCAL_GROUP).to eql(0x00000001)
    end

    it 'knows ACCOUNT_GROUP' do
      expect(described_class::ACCOUNT_GROUP).to eql(0x00000002)
    end

    it 'knows RESSOURCE_GROUP' do
      expect(described_class::RESSOURCE_GROUP).to eql(0x00000004)
    end

    it 'knows UNIVERSAL_GROUP' do
      expect(described_class::UNIVERSAL_GROUP).to eql(0x00000008)
    end

    it 'knows APP_BASIC_GROUP' do
      expect(described_class::APP_BASIC_GROUP).to eql(0x00000010)
    end

    it 'knows APP_QUERY_GROUP' do
      expect(described_class::APP_QUERY_GROUP).to eql(0x00000020)
    end

    it 'knows SECURITY_ENABLED' do
      expect(described_class::SECURITY_ENABLED).to eql(0x80000000)
    end
  end
end
