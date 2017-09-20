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

    def destroy # Deletes purchase
        @purchase = Purchase.find(params[:id]) 
        @purchase.destroy
        head :no_content # Will create HTTP response 200
    end
    
    def update
        @Purchase = Purchase.find(params[:id])
        if @Purchase.update(purchase_params)
            render json: @Purchase
        else
            render json: @Purchase.errors, status: :unprocessable_entity
        end
    end
    
    private
    
    def purchase_params
        params.require(:purchase).permit(:date, :purchasename, :costpurchased, :quantitypurchased)
    end 

    
end
