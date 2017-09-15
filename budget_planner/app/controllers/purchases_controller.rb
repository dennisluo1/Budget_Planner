class PurchasesController < ApplicationController
    def create # Create new purchase
        @Purchase = Purchase.new(purchase_params)

        if @purchase.save
            render json: @purchase
        else 
            render json: @purchase.errors, status: unprocessable_entity
        end
    end
    
    def index
        @purchases = Purchase.all
    end

    private
    
    def purchase_params
        params.require(:purchase).permit(:date, :purchasename, :costpurchased, :quantitypurchased)
    end 

    
end
