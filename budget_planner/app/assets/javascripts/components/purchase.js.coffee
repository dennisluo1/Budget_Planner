# Singular purchase
@Purchase = React.createClass
    render: -> # Create table elements to display props from component
        React.DOM.tr null, 
            React.DOM.td null, @props.purchase.date
            React.DOM.td null, @props.purchase.purchasename
            React.DOM.td null, @props.purchase.costpurchased
            React.DOM.td null, @props.purchase.quantitypurchased

