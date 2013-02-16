Chaplin = require 'chaplin'


module.exports = class KinveyLib extends Chaplin.Collection
  @kinvey_app_key = 'kid_TT7xEnQspM'
  @kinvey_secret = 'd23859c7a0944ec8a21d91606fd1da48'
  kinveyAuthenticatedSync = (method, model, options) ->
      options.beforeSend = (jqXHR) ->
          jqXHR.setRequestHeader(
            'Authorization',
            'Basic ' + $.base64.encode(
              @kinvey_app_key + ':' + @kinvey_secret
            )
          )
      Backbone.sync.call(this, method, model, options)

