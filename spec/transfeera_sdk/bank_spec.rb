require 'transfeera_sdk/bank'

RSpec.describe ::TransfeeraSDK::Bank, :bank do
  context 'getting bank id from bank code' do
    it 'should return the right bank code' do
      expect(described_class.new.bank_id_from_code('077')).to eq(25)
      expect(described_class.new.bank_id_from_code('001')).to eq(6)
    end
  end
end
