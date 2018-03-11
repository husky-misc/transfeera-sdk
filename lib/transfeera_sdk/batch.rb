require 'transfeera_sdk/base'

module TransfeeraSDK
  class Batch < TransfeeraSDK::Base
    def create!(opts = {})
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
  end
end
