# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require foundation
#= require underscore
#= require backbone
#= require backbone.marionette
#= require hamlcoffee
#= require_self
#= require_tree ../../templates/live_logs
#= require_tree ./controllers
#= require_tree ./routers
#= require_tree ./models
#= require_tree ./meta_views
#= require_tree ./views

window.RL = new Backbone.Marionette.Application

RL.addRegions
  header:   '#header'
  tabs:     '#tabs .wrapper'
  board:     '#board'
  modal:    '#modal'

RL.on 'initialize:after', (options)->
  Backbone.history.start() if Backbone.history
  $('#app').toggle()
  RL.logs = new RL.LogFiles()
  RL.tabs.show new RL.Tabs(collection: RL.logs)
  RL.board.show new RL.LogsBoard(collection: RL.logs)

RL.relPath = (path)->
  #rel = window.location.pathname + path
  rel = "/live_logs/#{path}"
  console.log "rel path #{rel}"
  rel

RL.JST = (path)->
  id = window.location.pathname
  id = id.substring(1) if id[0] == '/'
  id = id + '/' unless id[id.length - 1] == '/'
  id = id + path
  JST[id]
$(document).ready ()->
  $(document).foundation()
  $(document).on 'closed', '[data-reveal]', () ->
    RL.router.navigate('#');
  RL.start()
