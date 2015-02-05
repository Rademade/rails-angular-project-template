app.controller 'layout', [ '$scope', 'User',  ($scope, User) ->

   User.get().then (users)-> $scope.user = users[0]

]