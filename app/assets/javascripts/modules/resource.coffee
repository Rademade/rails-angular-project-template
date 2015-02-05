angular.module("appResource", [ "rails" ]).factory "AppModel", [
  "RailsResource",
  (RailsResource) ->

    class AppModel extends RailsResource

    AppModel.resourceUrl = (previous)->
      "/api" + RailsResource.resourceUrl.apply @, arguments

    AppModel
]