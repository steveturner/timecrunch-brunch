Controller = require 'controllers/base/controller'
LogInView = require 'views/ParseLoginView'
Work = require 'models/work'

module.exports = class HomeController extends Controller
  historyURL: 'home'

  index: ->
    console.log('home#show')
    if Parse.User.current()
      #new ManageTodosView();

      if Modernizr.geolocation
        navigator.geolocation.getCurrentPosition showMap

      console.log 'You are already logged in fool'
    else
      new LogInView();

showMap = (position) ->
  latitude = position.coords.latitude
  longitude = position.coords.longitude
  location = new Parse.GeoPoint(latitude,longitude)
  test = new Work("Work")
  test.set('score', 1337)
  user = Parse.User.current()
  test.set('user', user)
  test.set('location', location)
  test.save null
    success: (test)->
      console.log 'success'
    error: (test, error) ->
      console.log(error)
  console.log location

