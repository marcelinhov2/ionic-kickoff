class Routes extends Config
  constructor: ($stateProvider, $urlRouterProvider, $httpProvider) ->
    $stateProvider

      # setup an abstract state for the tabs directive
      .state 'sectionmenu',
        url: '/section'
        abstract: true
        templateUrl: '/partials/directives/side-menu.html'

      .state 'sectionmenu.home',
        url: '/home'
        views:
          menuContent:
            templateUrl: '/partials/views/home.html'
            controller: 'homeController'

    # if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/section/home')
    $httpProvider.interceptors.push 'HttpRequestInterceptor'