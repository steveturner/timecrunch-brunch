View = require 'views/base/view'
template = require 'views/templates/ParseLoginView'

module.exports = class ParseLoginView extends View
  template: template
  container: '.container'
  containerMethod: 'html'

  initialize: ->
    super
    @delegate 'submit', 'form.form-signin', @logIn
    @delegate 'submit', 'form.form-signup', @signUp
    @render()

  logIn: (e) ->
    e.preventDefault()
    username = @$('#login-username').val()
    password = @$('#login-password').val()
    myUser = new Kinvey.User()

    myUser.login username, password,
      success: (user) ->
        console.log user
      error: (error) =>
        @$('.form-signin .alert').html(error.description).show()
        #@$(".login-form button").removeAttr("disabled")

    #@$(".login-form button").attr("disabled", "disabled");

  signUp: (e)->
    e.preventDefault()
    username = @$('#signup-username').val()
    password = @$('#signup-password').val()


    Kinvey.User.create
      username: username
      password: password
    ,
      success: (user) ->
        console.log user
      error: (error) =>
        console.log "error signing up"
        @$('.form-signup .alert').html(error.description).show()
        @$(".form-signup button").removeAttr("disabled")

