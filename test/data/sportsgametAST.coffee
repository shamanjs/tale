module.exports =

  stories:

    User: [
      'has a Roster'
      'can login with Facebook'
      'can edit their Roster'
      'can reorder their Roster'
      'can create many Challenges'
      'can invite Users to a Challenge'
      'can be notified when invited to a Challenge'
      'can edit their Roster per Lineup'
    ]
    Challenge:
      [ 'has many Lineups' ]
    Lineup:
      [ 'has one Roster' ]