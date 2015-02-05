angular.module("appResource", [ "rails" ]).factory "App", [
  "RailsResource",
  (RailsResource) ->

    class App extends RailsResource

    App.resourceUrl = (previous)->
      "/api" + RailsResource.resourceUrl.apply @, arguments

    App
]