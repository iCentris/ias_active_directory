# frozen_string_literal: true

RSpec.describe IasActiveDirectory do
  describe 'concerning versioning' do
    it 'has a version number' do
      expect(IasActiveDirectory::VERSION).to eql('0.1.0')
    end
  end

  describe 'concerning module attributes' do
    it 'has an attribute for @@special_fields' do
      expect { IasActiveDirectory.special_fields }.not_to raise_error
    end

    it 'does not set the special fields to nil' do
      expect(IasActiveDirectory.special_fields).not_to be_nil
    end

    it 'returns the special fields as a hash' do
      expect(IasActiveDirectory.special_fields).to be_a(Hash)
    end

    it 'should have keys for the appropriate base classes' do
      %i[Base User Group Computer].each do |k|
        expect(IasActiveDirectory.special_fields).to have_key(k)
      end
    end

    # Base
    context 'concerning Base special fields' do
      it 'should have all the right keys' do
        %i[objectguid whencreated whenchanged memberof].each do |k|
          expect(IasActiveDirectory.special_fields[:Base]).to have_key(k)
        end
      end
    end

    # User
    context 'concerning User special fields' do
      it 'should have all the right keys' do
        %i[objectguid whencreated whenchanged objectsid msexchmailboxguid msexchmailboxsecuritydescriptor lastlogontimestamp pwdlastset accountexpires memberof].each do |k|
          expect(IasActiveDirectory.special_fields[:User]).to have_key(k)
        end
      end
    end

    # User
    context 'concerning User special fields' do
      it 'should have all the right keys' do
        %i[objectguid whencreated whenchanged objectsid msexchmailboxguid msexchmailboxsecuritydescriptor lastlogontimestamp pwdlastset accountexpires memberof].each do |k|
          expect(IasActiveDirectory.special_fields[:User]).to have_key(k)
        end
      end
    end

    # Group
    context 'concerning Group special fields' do
      it 'should have all the right keys' do
        %i[objectguid whencreate whenchanged objectsid memberof member].each do |k|
          expect(IasActiveDirectory.special_fields[:Group]).to have_key(k)
        end
      end
    end

    # Computer
    context 'concerning Computer special fields' do
      it 'should have all the right keys' do
        %i[objectguid whencreated whenchanged objectsid memberof member].each do |k|
          expect(IasActiveDirectory.special_fields[:Computer]).to have_key(k)
        end
      end
    end
  end
end
