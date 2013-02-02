Chaplin = require 'chaplin'

module.exports = class Model extends Parse.Object
  # Mixin an Event Broker
  _(@prototype).extend Chaplin.EventBroker

  attributes = [
    'initDeferred', 'getAttributes', 'serialize',
    'disposed', 'dispose'
  ]
  for attr in attributes
    @::[attr] = Chaplin.Model::[attr]
