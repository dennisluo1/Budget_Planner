class PurchasesController < ApplicationController
    def create # Create new purchase
        @Purchase = Purchase.new(purchase_params)

        if @Purchase.save
            render json: @Purchase
        else 
            render json: @Purchase.errors, status: unprocessable_entity
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
