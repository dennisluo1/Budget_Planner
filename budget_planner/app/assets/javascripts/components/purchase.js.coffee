# Singular purchase
@Purchase = React.createClass
    handleDelete: (e) -> 
        e.preventDefault() # Prevent default action of anchor
        $.ajax # Use jquery to make ajax request
            method: 'DELETE'
            url: "/purchases/#{ @props.purchase.id }"
            dataType: 'JSON'
            success: () => 
                @props.handleDeleteLift @props.purchase # Notify parent component purchases by sending this component's data to handleDelete 
    render: -> # Create table elements to display props from component
        React.DOM.tr null, 
            React.DOM.td null, @props.purchase.date
            React.DOM.td null, @props.purchase.purchasename
            React.DOM.td null, @props.purchase.costpurchased
            React.DOM.td null, @props.purchase.quantitypurchased
            React.DOM.td null,
                React.DOM.a
                    className: 'btn btn-delete'
                    onClick: @handleDelete
                    'Delete'

