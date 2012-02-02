module Admin
  class ProductsController < Admin::BaseController

    crudify :product, :paging => false

  end
end
