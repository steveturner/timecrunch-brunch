View = require 'views/base/view'
template = require 'views/templates/ParseLoginView'

module.exports = class ParseLoginView extends View
  template: template
  container: '.container'
  containerMethod: 'html'

  initialize: ->
    super
    @delegate 'submit', 'form.login-form', @logIn
    @delegate 'submit', 'form.signup-form', @signUp
    @render()

  logIn: (e) ->
    e.preventDefault()
    username = @$('#login-username').val()
    password = @$('#login-password').val()

    Parse.User.logIn username, password,
      success: (user) ->
        console.log user
      error: (user, error) ->
        @$('.login-form .error').html("Invalid username or password. Please try again.").show()
        @$(".login-form button").removeAttr("disabled")

    @$(".login-form button").attr("disabled", "disabled");

  signUp: (e)->
    e.preventDefault()
    username = @$('#signup-username').val()
    password = @$('#signup-password').val()

    Parse.User.signUp username, password, { ACL: new Parse.ACL()},
      success: (user) ->
        console.log user
      error: (user, error) ->
        @$('.signup-form .error').html("Invalid username or password. Please try again.").show()
        @$(".signup-form button").removeAttr("disabled")

