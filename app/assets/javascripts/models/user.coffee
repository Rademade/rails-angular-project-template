app.factory 'User', ['AppModel', (AppModel) ->

  class User extends AppModel
    @configure url: '/users', name: 'users'
]