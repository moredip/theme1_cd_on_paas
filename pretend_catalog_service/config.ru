$LOAD_PATH.unshift File.expand_path( "../lib", __FILE__ )

require 'request_store'

require 'catalog_service/api'
require 'microscope_tracer/rack_middleware'

ENV["RACK_ENV"] ||= "development"

if ENV['RACK_ENV'].downcase == 'development'
  $stdout.sync = true
  puts "running in DEV MODE!"
end

use MicroscopeTracer::RackMiddleware, 'catalog-service'
run CatalogService::API
