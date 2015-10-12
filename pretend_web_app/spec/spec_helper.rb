require 'pry'

ENV['RACK_ENV'] ||= 'test'

Dir.glob(File.expand_path('../../lib/**/*.rb', __FILE__)) {|file| require file}

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
end
