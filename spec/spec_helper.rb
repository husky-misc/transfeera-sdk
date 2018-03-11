require "bundler/setup"
require "transfeera_sdk"
require "webmock/rspec"
require "support/vcr"

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end

  config.cassette_serializers[:styled_yaml] = StyledYAML
  config.default_cassette_options = { serialize_with: :styled_yaml }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :each do
    TransfeeraSDK.token       = '123-123-123-123-123-123'
    TransfeeraSDK.user_agent  = 'test@husky.io'
  end
end
