module.exports = 
  
  roles:
    Admin:
      auth: 'password'
    User:
      auth: 'facebook' 
      has: ['Profile']

  models:
    Board:
      create:    [ 'Admin'  ]
      read:      [ 'User'   ]
      hasMany:   [ 'Thread' ]
    Thread: 
      create:    [ 'User'  ]
      hasMany:   [ 'Post'  ]
      belongsTo: [ 'Board' ]
    Post:
      create:    [ 'User'   ]
      belongsTo: [ 'Thread' ]

  services: {}
