require 'lazy_doc'

module WebStore
  class Product 
    include LazyDoc::DSL

    access :sku
    access :name
    access :desc

    def initialize(doc)
      lazily_embed(doc)
    end
  end
end
