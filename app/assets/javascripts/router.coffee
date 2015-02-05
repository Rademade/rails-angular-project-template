app.config([
  '$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider
    .state 'public',
      abstract: true,
      url: '',
      templateUrl: 'layout.html',
      controller: 'layout'

    .state 'public.index',
      url: '/',
      templateUrl: 'pages/index.html'


    $urlRouterProvider.otherwise '/'

    $locationProvider.html5Mode
      enabled: true
      requireBase: false
      html5Mode: true

])