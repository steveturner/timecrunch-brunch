Controller = require 'controllers/base/controller'
LogInView = require 'views/ParseLoginView'

module.exports = class HomeController extends Controller
  historyURL: 'home'

  index: ->
    console.log('home#show')
    if Parse.User.current()
      new ManageTodosView();
    else
      new LogInView();
