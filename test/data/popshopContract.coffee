module.exports = 

  roles:
    Buyer: {}
    Seller: {}

  models:
    Item:
      create:    [ 'Seller' ]
      belongsTo: [ 'Store' ]
    Store:
      create:  [ 'Seller' ]
      read:    [ 'Buyer'  ]
      hasMany: [ 'Item'   ]

  services:
    processSale: {}
    promoteStore: {}
    purchaseItems: {}