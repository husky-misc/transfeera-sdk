require "transfeera_sdk/version"
require 'active_support/all'
require 'json'
require 'rest_client'
require 'bigdecimal'
require 'digest/sha2'
require 'base64'

module TransfeeraSDK
  mattr_accessor :token
  mattr_accessor :user_agent

	extend ::ActiveSupport::Autoload

  autoload :Bank
  autoload :Batch
  autoload :Transfer
end
