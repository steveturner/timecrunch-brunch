Chaplin = require 'chaplin'
mediator = require 'mediator'
routes = require 'routes'
SessionController = require 'controllers/session_controller'
IssueController = require 'controllers/issue_controller'
HeaderController = require 'controllers/header_controller'
FooterController = require 'controllers/footer_controller'
Layout = require 'views/layout'
kinveyutils = require 'lib/kinveylib'

# The application object
module.exports = class Application extends Chaplin.Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Brunch example application'

  initialize: ->
    super
     # Init Parse:
    Parse.initialize("bAcxn1Ap3wkPjCe4yhXy1aopekyxF8pPvAsnz6CA", "reLlKNZ0HR8laFARViQY6oq4NTivN0DRXMMBvltZ")
    
    Kinvey.Sync.configure
      conflict: Kinvey.Sync.clientAlwaysWins

    Kinvey.init
      appKey: kinveyutils.kinvey_app_key
      appSecret: kinveyutils.kinvey_secret
      sync:true

    if(!Kinvey.Sync.isOnline)
      alert('You are working in offline mode.');

    Kinvey.Sync.count
      success: (count) ->
        alert('You have modified ' + count + ' entities while working in offline mode.');
    
      error: (e) ->
        console.log "error syncing"

    # Initialize core components
    @initDispatcher()
    @initLayout()
    @initMediator()

    # Application-specific scaffold
    @initControllers()

    # Register all routes and start routing
    @initRouter routes
    # You might pass Router/History options as the second parameter.
    # Chaplin enables pushState per default and Backbone uses / as
    # the root per default. You might change that in the options
    # if necessary:
    # @initRouter routes, pushState: false, root: '/subdir/'
    #     # Freeze the application instance to prevent further changes
    Object.freeze? this

  # Override standard layout initializer
  # ------------------------------------
  initLayout: ->
    # Use an application-specific Layout class. Currently this adds
    # no features to the standard Chaplin Layout, it’s an empty placeholder.
    @layout = new Layout {@title}

  # Instantiate common controllers
  # ------------------------------
  initControllers: ->
    # These controllers are active during the whole application runtime.
    # You don’t need to instantiate all controllers here, only special
    # controllers which do not to respond to routes. They may govern models
    # and views which are needed the whole time, for example header, footer
    # or navigation views.
    # e.g. new NavigationController()
    new SessionController()
    new IssueController()
    new HeaderController()
    new FooterController()

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    # Create a user property
    mediator.user = null
    # Add additional application-specific properties and methods
    # Seal the mediator
    mediator.seal()