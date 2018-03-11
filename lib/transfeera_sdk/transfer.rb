require 'transfeera_sdk/base'

module TransfeeraSDK
  class Transfer < TransfeeraSDK::Base
    def create!(batch_id, opts = {})
      send_request(:post, "/batch/#{batch_id}/transfer", opts)
    end

    def details(transfer_id)
      send_request(:get, "/transfer/#{transfer_id}")
    end

    def remove!(batch_id, transfer_id)
      send_request(:delete, "/bacth/#{batch_id}/transfer/#{transfer_id}")
    end
  end
end
