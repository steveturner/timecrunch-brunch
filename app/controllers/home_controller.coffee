Controller = require 'controllers/base/controller'
LogInView = require 'views/ParseLoginView'
Work = require 'models/work'

module.exports = class HomeController extends Controller
  historyURL: 'home'

  index: ->
    console.log('home#show')
    if Kinvey.getCurrentUser()
      #new ManageTodosView();

      test = new Work
        
        latitude: 69
        longitude: 69
    
      test.save
        success: (test)->
          console.log 'success'
        error: (error) ->
          console.log(error)


      #if Modernizr.geolocation
      #  navigator.geolocation.getCurrentPosition showMap



      console.log 'You are already logged in fool'
    else
      new LogInView();

showMap = (position) ->
  latitude = position.coords.latitude
  longitude = position.coords.longitude
  location = new Parse.GeoPoint(latitude,longitude)
  test = new Work
    user: Kinvey.getCurrentUser()
    latitude: latitude
    longitude: longitude
  
  test.save
    success: (test)->
      console.log 'success'
    error: (error) ->
      console.log(error)
  console.log location

