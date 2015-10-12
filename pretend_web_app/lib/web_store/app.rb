require "sinatra/base"
require "sinatra/reloader"

require "tilt/haml"

require 'web_store/deals_gateway'

module WebStore
class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path("../**/*.rb", __FILE__)
  end

  configure do
    set :views, File.expand_path( "../../../views", __FILE__ )
  end

  helpers do
    def product_url(product)
      "/products/#{product.sku}"
    end
  end

  get "/" do
    deals = deals_gateway.deals
    products = catalog_gateway.all_products

    view_model = { deals: deals, products: products }
    haml :index, locals: view_model
  end

  get "/products/:sku" do
    deals = deals_gateway.deals
    product = catalog_gateway.lookup_by_sku(params[:sku])
    # TODO: 404 if product missing

    view_model = { deals: deals, product: product }
    haml :product, locals: view_model
  end

  private

  def deals_gateway
    settings.deals_gateway
  end

  def catalog_gateway
    settings.catalog_gateway
  end
end
end
