mediator = require 'mediator'
utils = require 'lib/utils'
ServiceProvider = require 'lib/services/service_provider'

module.exports = class ParseProvider extends ServiceProvider
  # Client-Side OAuth 2.0 login with Google
  # https://code.google.com/p/google-api-javascript-client/
  # https://code.google.com/p/google-api-javascript-client/wiki/Authentication

  # Note: This is the ID for an example Google API project.
  # You might change this to your own project ID.
  # See https://code.google.com/apis/console/
  @appId = "bAcxn1Ap3wkPjCe4yhXy1aopekyxF8pPvAsnz6CA"
  @javascriptId = "reLlKNZ0HR8laFARViQY6oq4NTivN0DRXMMBvltZ"

  # The permissions we’re asking for. This is a space-separated list of URLs.
  # See https://developers.google.com/accounts/docs/OAuth2Login#scopeparameter
  # and the individual Google API documentations

  name: 'parse'

  load: ->
    @resolve()
    this

  isLoaded: ->
    yes

  triggerLogin: (loginContext)  ->
    console.log "triggerLogin: Parse"
    Parse.User.logIn 'test', 'test',
      success: (user) ->
        console.log user
      error: (user, error) ->
        console.log error

  loginHandler: (loginContext, authResponse) ->
    console.log authResponse
    if authResponse
      # Publish successful login
      mediator.publish 'loginSuccessful', {provider: this, loginContext}

      # Publish the session with extra userinfo
      @getUserInfo (userInfo) ->
        data =
          provider: this
          accessToken: authResponse.access_token
        _.extend(data, userInfo)
        console.log 'serviceProviderSession:', data
        mediator.publish 'serviceProviderSession', data
    else
      mediator.publish 'loginFail', {provider: this, loginContext}

  getLoginStatus: (callback) ->
    Parse?.User?.current()?
  # TODO
  getUserInfo: (callback) ->
    request = gapi.client.request path: '/oauth2/v2/userinfo'
    request.execute callback