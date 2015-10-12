$LOAD_PATH.unshift File.expand_path( "../lib", __FILE__ )

require 'request_store'

require 'web_store/app'
require 'web_store/deals_gateway'
require 'web_store/catalog_gateway'
require 'microscope_tracer/rack_middleware'

ENV["RACK_ENV"] ||= "development"

if ENV['RACK_ENV'].downcase == 'development'
  $stdout.sync = true
  puts "running in DEV MODE!"
end

$MICROSCOPE_SERVICE_NAME='web-store'

use MicroscopeTracer::RackMiddleware, $MICROSCOPE_SERVICE_NAME

WebStore::App.set( :deals_gateway, WebStore::DealsGateway.for_env )
WebStore::App.set( :catalog_gateway, WebStore::CatalogGateway.for_env )
run WebStore::App
