Chaplin = require 'chaplin'
utils = require 'lib/kinveylib'
module.exports = class Collection extends Kinvey.Collection
  #sync: utils.kinveyAuthenticatedSync

  constructor: (collection, options) ->
    @options || (@options = {})
    @options.store = Kinvey.Store.OFFLINE
    super(collection, options)


  oldest: null
  newest: null

  history: (options) ->
    query = new Kinvey.Query()
    #if @options.id
    #  query.on('to.id').equal(@options.id).or(new Kinvey.Query().on('author.id'))

    @.fetch(@options)

    # Mixin an Event Broker
  _(@prototype).extend Chaplin.EventBroker
  attributes = [
    'initDeferred', 'getAttributes', 'serialize',
    'disposed', 'dispose'
  ]
  for attr in attributes
    @::[attr] = Chaplin.Model::[attr]
