class BrandsController < InheritedResources::Base

  private

    def brand_params
      params.require(:brand).permit(:name, :country, :code, :active)
    end

end
