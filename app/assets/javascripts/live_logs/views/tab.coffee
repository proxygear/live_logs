class RL.Tab extends Marionette.ItemView
  serializeData: ()-> @model
  template: RL.JST 'tab'
  tagName: 'li'
  events:
    'click a.name': 'show_logs'
    'click a.close': 'close_logs'
  onItemRendered: ()->
    this.select()
  show_logs: ()->
    RL.logs.trigger('selected', this.model)
  close_logs: ()->
    RL.logs.remove this.model
  logs_view: ()->
    unless this.logs
      this.logs = new RL.Logs(model: this.model)
    this.logs
  #Selectable protocol (see SelectableCollectionView)
  select: ()->
    this.$el.addClass 'active'
  unselect: ()->
    console.log 'unselect'
    this.$el.removeClass 'active'