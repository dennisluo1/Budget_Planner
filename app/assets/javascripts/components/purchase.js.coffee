# Singular purchase, will need to convert to more modern conventional React syntax later
@Purchase = React.createClass
    getInitialState: -> # Set edit value
        edit: false
    handleToggle: (e) ->  # Must trigger function to reverse boolean value of state.edit
        e.preventDefault() 
        @setState edit: !@state.edit
    handleDelete: (e) -> 
        e.preventDefault() # Prevent default action of anchor
        $.ajax # Use jquery to make ajax request
            method: 'DELETE'
            url: "/purchases/#{ @props.purchase.id }"
            dataType: 'JSON'
            success: () => 
                @props.handleDeletePurchase @props.purchase # Notify parent component purchases by sending this component's data to handleDelete 
    toggleUnit: (e) ->  
        e.preventDefault()     
    handleEdit: (e) -> 
        e.preventDefault()
        data = 
            date: document.getElementById('date').value 
            purchasename: document.getElementById('purchasename').value
            costpurchased: document.getElementById('costpurchased').value
            quantitypurchased: document.getElementById('quantitypurchased').value
        $.ajax # Send Ajax request to put updated purchase
            method: 'PUT'
            url: "/purchases/#{ @props.purchase.id }"   
            dataType: 'JSON'
            data: 
                purchase: data
            success: (data) => 
                @setState edit: false
                @props.handleEditPurchase @props.purchase, data

    purchaseRow: -> # Create table elements to display props from component
        React.DOM.tr null, # function should return current row with edit button added
            React.DOM.td null, @props.purchase.date
            React.DOM.td null, @props.purchase.purchasename
            React.DOM.td null, @props.purchase.costpurchased
            React.DOM.td null, @props.purchase.quantitypurchased
            React.DOM.td null, 
                React.DOM.button
                    className: 'btn btn-primary'
                    onClick: @handleToggle
                    'Edit'
                React.DOM.button
                    className: 'btn btn-danger'
                    onClick: @handleDelete
                    'Delete'
    purchaseForm: -> # Create purchaseForm and purchase functions for conditional
        React.DOM.tr null, # Should return input fields and buttons
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'date'
                    defaultValue: @props.purchase.date
                    id: 'date'
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'text'
                    defaultValue: @props.purchase.purchasename
                    id: 'purchasename'
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'number'
                    defaultValue: @props.purchase.costpurchased
                    id: 'costpurchased'                    
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'number'
                    defaultValue: @props.purchase.quantitypurchased
                    id: 'quantitypurchased'  
            React.DOM.td null, # When edit is triggered, lead to update
                React.DOM.button
                    className: 'btn btn-primary'
                    onClick: @handleEdit
                    'Update'
                React.DOM.button
                    className: 'btn btn-danger'
                    onClick: @handleToggle # This will delete item when you press cancel. Need to fix this error
                    'Cancel'
    render: -> # Will return React element, create if/else for edit functionality
        if @state.edit
            @purchaseForm()
        else 
            @purchaseRow()


