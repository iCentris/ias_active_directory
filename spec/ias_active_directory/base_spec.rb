# frozen_string_literal: true

RSpec.describe IasActiveDirectory::Base do
  describe 'concerning constant' do
    context 'NIL_FILTER' do
      it 'knows the NIL_FILTER class' do
        expect(described_class::NIL_FILTER).to be_a(Net::LDAP::Filter)
      end

      it 'knows the @left attribute' do
        expect(described_class::NIL_FILTER.instance_variable_get(:@left)).to eql('cn')
      end
    end
  end
end
