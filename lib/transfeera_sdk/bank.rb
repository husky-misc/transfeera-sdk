require 'transfeera_sdk/base'

module TransfeeraSDK
  class Bank < TransfeeraSDK::Base
    def list
      send_request(:get, "/bank")
    end

    def destination_bank_account
      send_request(:get, "destinationBankAccount")
    end
  end
end
