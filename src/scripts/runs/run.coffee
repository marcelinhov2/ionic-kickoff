class Run extends Run
  constructor: ($ionicPlatform, $timeout, $cordovaSplashscreen) ->
    $ionicPlatform.ready ->
      # Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      #  for form inputs)
      if window.cordova && window.cordova.plugins.Keyboard
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)

      if window.StatusBar
        # org.apache.cordova.statusbar required
        StatusBar.styleDefault()

      $timeout (=>
        $cordovaSplashscreen.hide()
      ), 2000