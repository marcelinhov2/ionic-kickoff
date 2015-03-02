class App extends Controller
  constructor: (@$scope, @$rootScope, @$timeout, @$location, @$ionicSideMenuDelegate, @localStorageService) ->
    do @defineTemplateMethods

  defineTemplateMethods: =>
    @$scope.toggleLeft = @toggleLeft

  toggleLeft: =>
    do @$ionicSideMenuDelegate.toggleLeft