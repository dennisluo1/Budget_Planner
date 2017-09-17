# Create component to render data to browser
@Purchases = React.createClass 
    getInitialState: -> # Sets initial state of component
        purchases: @props.data 
    getDefaultProps: ->  # Defines value that component has by default
        purchases: []
    addPurchase: (purchase) -> # Takes in data from addPurchase and renders to purchase
        purchases = @state.purchases.slice()
        purchases.push purchase
        @setState purchases: purchases
    deletePurchase: (purchase) -> 
        purchases = @state.purchases.slice()
        index = purchases.indexOf purchase
        purchases.splice index, 1
        @replaceState purchases: purchases
    updatePurchase: (purchase, data) -> 
        index = @state.purchases.indexOf purchase
        purchases = React.addons.update(@state.purchases { $splice: [[index, 1, data]] })
        @replaceState purchases: purchases
    render: ->  
        React.DOM.div
            className: 'purchases'
            React.DOM.h1
                className: 'title'
                'Purchases'
            React.createElement PurchaseForm, handleNewPurchase: @addPurchase # Render purchase form component 
            React.DOM.table # Pass purchase data 
                className: 'table border'
                React.DOM.thead null, # Outputs header row
                    React.DOM.tr null,
                        React.DOM.th null, 'Date'
                        React.DOM.th null, 'Purchase Item(s)'                    
                        React.DOM.th null, 'Cost ($)'
                        React.DOM.th null, 'Quantity'
                        React.DOM.th null, 'Delete'
                React.DOM.tbody null, # Outputs the data below header
                    for purchase in @state.purchases
                        React.createElement Purchase, key: purchase.id, purchase: purchase, handleDeletePurchase: @deletePurchase, handleEditPurchase: @updatePurchase                                     