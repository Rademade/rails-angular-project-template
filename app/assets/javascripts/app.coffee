window.app = angular.module('app', [
  'ui.router',
  'templates',
  'rails',
  'ngSanitize',
  'appResource'
]).run [ "$rootScope", ($rootScope) ->

]