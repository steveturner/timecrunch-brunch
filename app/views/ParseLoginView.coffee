View = require 'views/base/view'
template = require 'views/templates/ParseLoginView'

module.exports = class ParseLoginViewView extends View
  template: template
  container: '.container'
  containerMethod: 'html'

  initialize: ->
    super
    _.bindAll(@, "logIn", "signUp");
    @delegate 'submit', 'form.login-form', @logIn
    @delegate 'submit', 'form.login-form', @logIn
    @render()

  logIn: (e) ->
    username = @$('#login-username').val()
    password = @$('#login-password').val()

    Parse.User.logIn username, password,
      success: (user) ->
        console.log 'schweet'
      error: (user, error) ->
        @$('.login-form .error').html("Invalid username or password. Please try again.").show()
        @$(".login-form button").removeAttr("disabled")

  signUp: ->
    console.log 'woot signup'

