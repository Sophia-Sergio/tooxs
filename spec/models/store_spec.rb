require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Validations' do
    context 'When not valid' do
      it 'is invalid without name' do
        expect(build(:store, name: nil)).to be_invalid
      end

      it 'is invalid without Address' do
        store = build(:store)
        store.street = nil
        store.number = nil
        store.city = nil
        store.district = nil
        store.country = nil

        expect(store).to be_invalid
      end
    end

    context 'When valid' do
      it { expect(build(:store)).to be_valid }
    end
  end

  describe 'when upload from xlsx' do
    let(:xlsx) do
      extend ActionDispatch::TestProcess
      fixture_file_upload('files/store_demo_data.xlsx')
    end

    it { expect(Store.from_xlsx(xlsx)).to_not be_nil }
    it { expect(Store.from_xlsx).to be_nil }
  end
end
