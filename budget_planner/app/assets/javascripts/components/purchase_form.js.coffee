# React component to display form
@PurchaseForm = React.createClass
    getInitialState: -> # Will set initial values for fields
        date: ''
        purchasename: ''
        costpurchased: ''
        quantitypurchased: ''
    handleValueChange: (e) -> # Detects input
        valueName = e.target.name
        @setState "#{ valueName }": e.target.value # Updates component state with new value, triggers UI refresh using component new state
    # toggleUnit: (e) -> 
    #     e.preventDefault()
    valid: -> 
        @state.date && @state.purchasename && @state.costpurchased && @state.quantitypurchased
    handleSubmit: (e) -> # Prevents default action, rails submit http request
        e.preventDefault()
        $.post '', { purchase: @state }, (data) => # jQuery post to database 
            @props.handleNewPurchase data
            @setState @getInitialState()
        , 'JSON'
    render: -> 
        React.DOM.form
            className: 'form-main'
            onSubmit: @handleSubmit
            React.DOM.input # Value attribute of input, date is set to component in state
                type: 'date' # Date
                className: 'form-value'
                placeholder: 'date'
                name: 'date'
                value: @state.date
                onChange: @handleValueChange # Handles keystroke when detected               
            React.DOM.input
                type: 'text' # Purchase Name
                className: 'form-value'
                placeholder: 'purchasename'
                name: 'purchasename'
                value: @state.purchasename
                onChange: @handleValueChange               
            React.DOM.input
                type: 'number' # Cost Purchased
                className: 'form-value'
                placeholder: 'costpurchased'
                name: 'costpurchased'
                value: @state.costpurchased
                onChange: @handleValueChange
            React.DOM.input
                type: 'number' # Quantity Purchased
                className: 'form-value'
                placeholder: 'Quantity'
                name: 'quantitypurchased'
                value: @state.quantitypurchased
                onChange: @handleValueChange
            # React.DOM.button 
            #     className: 'btn btn-submit'
            #     onClick: @toggleUnit
            React.DOM.button
                type: 'submit' # Submit Button
                className: 'btn btn-submit'
                disabled: !@valid()
                'Add Purchase'
            
