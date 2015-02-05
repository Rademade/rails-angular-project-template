app.factory 'User', ['RailsAngularProjectTemplate', (RailsAngularProjectTemplate) ->

  class User extends RailsAngularProjectTemplate
    @configure url: '/users', name: 'users'
]