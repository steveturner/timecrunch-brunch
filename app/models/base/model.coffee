Chaplin = require 'chaplin'
utils = require 'lib/kinveylib'
module.exports = class Model extends Chaplin.Model
  sync: utils.kinveyAuthenticatedSync
  idAttribute: '_id'
