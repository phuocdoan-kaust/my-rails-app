class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :brand_id, :price, :active, :currency)
    end

end
