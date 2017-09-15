# Create component to render data to browser
@Purchases = React.createClass 
    getInitialState: -> # Sets initial state of component
        purchases: @props.data 
    getDefaultProps: ->  # Defines value that component has by default
        purchases: []
    render: ->  
        React.DOM.div
            className: 'purchases'
            React.DOM.h1
                className: 'title'
                'Purchases'
            React.DOM.table # Pass purchase data 
                className: 'table border'
                React.DOM.thead null, # Outputs header row
                        React.DOM.th null, 'Date'
                        React.DOM.th null, 'Purchase Item(s)'                    
                        React.DOM.th null, 'Cost ($)'
                        React.DOM.th null, 'Quantity'
                    React.DOM.tbody null, # Outputs the data below header
                        for purchase in @state.purchases
                            React.createElement Purchase, key: purchase.id, purchase: purchase                                     