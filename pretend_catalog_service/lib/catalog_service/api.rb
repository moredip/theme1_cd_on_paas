require 'grape'

require 'catalog_service/product_repo'

# ick
$global_product_repo = CatalogService::ProductRepo.from_yaml(File.expand_path("../../../data/products.yaml",__FILE__))

module CatalogService
  class API < Grape::API
   format :json

    helpers do
      def product_repo
        $global_product_repo
      end
    end

    get do
      redirect "/products"
    end

    get '/products' do
      product_repo.all_products
    end

    get '/products/:sku' do
      product_repo.lookup_by_sku(params[:sku]) or error!('Product not found', 404)
    end
  end
end
