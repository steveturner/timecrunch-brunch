Model = require 'models/base/model'

module.exports = class Work extends Model
  constructor:(attr) ->
    super(attr, 'checkins')
