# Singular purchase
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
    toggleUnit: (e) -> # ********* Check this line of code 
        e.preventDefault() # ********* Check this line of code     
    handleEdit: (e) -> # Send Ajax request 
        e.preventDefault()
        data = 
            # Use ReactDom.findDOMNode to take values from form using refs
            date: ReactDOM.findDOMNode(@refs.date).value # Error:Only a ReactOwner can have refs. You might be adding a ref to a component that was not created inside a component's `render` method
            purchasename: ReactDOM.findDOMNode(@refs.purchasename).value
            costpurchased: ReactDOM.findDOMNode(@refs.costpurchased).value
            quantitypurchased: ReactDOM.findDOMNode(@refs.quantitypurchased).value
        $.ajax 
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
                    className: 'btn btn-edit'
                    onClick: @handleToggle
                    'Edit'
                React.DOM.button
                    className: 'btn btn-delete'
                    onClick: @handleDelete
                    'Delete'
    purchaseForm: -> # Create purchaseForm and purchase functions for conditional
        React.DOM.tr null, # Should return input fields and buttons
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'date'
                    defaultValue: @props.purchase.date
                    ref: 'date'
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'text'
                    defaultValue: @props.purchase.purchasename
                    ref: 'purchasename'
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'number'
                    defaultValue: @props.purchase.costpurchased
                    ref: 'costpurchased'                    
            React.DOM.td null,
                React.DOM.input
                    className: 'form-main'
                    type: 'number'
                    defaultValue: @props.purchase.quantitypurchased
                    ref: 'quantitypurchased'  
            React.DOM.td null, # When edit is triggered, lead to update
                React.DOM.button
                    className: 'btn btn-edit'
                    onClick: @handleEdit
                    'Update'
                React.DOM.button
                    className: 'btn btn-delete'
                    # onClick: @handleToggle # This will delete item when you press cancel. Need to fix this error
                    'Cancel'
    render: -> # Will return React element
        if @state.edit
            @purchaseForm()
        else 
            @purchaseRow()


