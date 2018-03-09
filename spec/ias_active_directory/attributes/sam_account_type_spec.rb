# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ::IasActiveDirectory::SamAccountType do
  describe 'concerning constants' do
    it 'knows DOMAIN_OBJECT' do
      expect(described_class::DOMAIN_OBJECT).to eql(0x0)
    end

    it 'knows GROUP_OBJECT' do
      expect(described_class::GROUP_OBJECT).to eql(0x10000000)
    end

    it 'knows NON_SECURITY_GROUP_OBJECT' do
      expect(described_class::NON_SECURITY_GROUP_OBJECT).to eql(0x10000001)
    end

    it 'knows ALIAS_OBJECT' do
      expect(described_class::ALIAS_OBJECT).to eql(0x20000000)
    end

    it 'knows NON_SECURITY_ALIAS_OBJECT' do
      expect(described_class::NON_SECURITY_ALIAS_OBJECT).to eql(0x20000001)
    end

    it 'knows USER_OBJECT' do
      expect(described_class::USER_OBJECT).to eql(0x30000000)
    end

    it 'knows NORMAL_USER_ACCOUNT' do
      expect(described_class::NORMAL_USER_ACCOUNT).to eql(0x30000000)
    end

    it 'knows MACHINE_ACCOUNT' do
      expect(described_class::MACHINE_ACCOUNT).to eql(0x30000001)
    end

    it 'knows TRUST_ACCOUNT' do
      expect(described_class::TRUST_ACCOUNT).to eql(0x30000002)
    end

    it 'knows APP_BASIC_GROUP' do
      expect(described_class::APP_BASIC_GROUP).to eql(0x40000000)
    end

    it 'knows APP_QUERY_GROUP' do
      expect(described_class::APP_QUERY_GROUP).to eql(0x40000001)
    end

    it 'knows ACCOUNT_TYPE_MAX' do
      expect(described_class::ACCOUNT_TYPE_MAX).to eql(0x7fffffff)
    end
  end
end
