angular.module("appResource", [ "rails" ]).factory "RailsAngularProjectTemplate", [
  "RailsResource",
  (RailsResource) ->

    class RailsAngularProjectTemplate extends RailsResource

    RailsAngularProjectTemplate.resourceUrl = (previous)->
      "/api" + RailsResource.resourceUrl.apply @, arguments

    RailsAngularProjectTemplate
]