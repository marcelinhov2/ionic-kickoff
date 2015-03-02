class HttpRequestInterceptor extends Factory
  constructor: (@$q, @$location, @$rootScope, @localStorageService) ->
    @queue = []

    return {
      request: (config) =>
        console.log('request')
        
        return config
      
      requestError: (rejection) =>
        console.log('requestError')

        return rejection

      response: (response) =>
        console.log('response')

        return response
      
      responseError: (rejection) =>
        console.log('responseError')

        return rejection
    }