Chaplin = require 'chaplin'
utils = require 'lib/kinveylib'
module.exports = class Model extends Kinvey.Entity
  #sync: utils.kinveyAuthenticatedSync
  #idAttribute: '_id'

  constructor: (attr, collection) ->
    super(attr, collection, store: Kinvey.Store.OFFLINE)

  added: ->
    @.getMetadata().lastModified()

    # Mixin an Event Broker
  _(@prototype).extend Chaplin.EventBroker
  attributes = [
    'initDeferred', 'getAttributes', 'serialize',
    'disposed', 'dispose'
  ]
  for attr in attributes
    @::[attr] = Chaplin.Model::[attr]
