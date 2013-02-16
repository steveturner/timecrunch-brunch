Chaplin = require 'chaplin'
utils = require 'lib/kinveylib'
module.exports = class Collection extends Chaplin.Collection
  sync: utils.kinveyAuthenticatedSync
