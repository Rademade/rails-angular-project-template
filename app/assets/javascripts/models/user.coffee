app.factory 'User', ['App', (App) ->

  class User extends App
    @configure url: '/users', name: 'users'
]