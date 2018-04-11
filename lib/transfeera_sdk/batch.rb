require 'transfeera_sdk/base'
require 'transfeera_sdk/bank'

module TransfeeraSDK
  class Batch < TransfeeraSDK::Base
    def create!(opts = {})
      update_bank_ids(opts)
      send_request(:post, "/batch", opts)
    end

    def update!(batch_id, opts = {})
      send_request(:put, "/batch/#{batch_id}", opts)
    end

    def details(batch_id)
      send_request(:get, "/batch/#{batch_id}")
    end

    def close!(batch_id)
      send_request(:post, "/batch/#{batch_id}/close")
    end

    def remove(batch_id)
      send_request(:delete, "/batch/#{batch_id}")
    end

    def transfers(batch_id)
      send_request(:get, "/batch/#{batch_id}/transfer")
    end

    private

    def update_bank_ids(opts)
      opts['transfers'].each do |transfer|
        bank_code = transfer['destination_bank_account']['bank_id'].to_s.rjust(3, '0')
        transfer['destination_bank_account']['bank_id'] = ::TransfeeraSDK::Bank.new.bank_id_from_code(bank_code)
      end
    end
  end
end
