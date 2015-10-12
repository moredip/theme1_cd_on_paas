require 'lazy_doc'

module WebStore
  class Deal 
    include LazyDoc::DSL

    access :sku
    access :desc
    access :price

    def initialize(doc)
      lazily_embed(doc)
    end
  end
end
