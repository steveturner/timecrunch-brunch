Chaplin = require 'chaplin'
utils = require 'lib/kinveylib'
module.exports = class Model extends Chaplin.Model
  sync: utils.kinveyAuthenticatedSync
  idAttribute: '_id'

    # Mixin an Event Broker
  _(@prototype).extend Chaplin.EventBroker
  attributes = [
    'initDeferred', 'getAttributes', 'serialize',
    'disposed', 'dispose'
  ]
  for attr in attributes
    @::[attr] = Chaplin.Model::[attr]
