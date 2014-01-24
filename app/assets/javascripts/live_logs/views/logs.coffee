class RL.Logs extends Marionette.ItemView
  serializeData: ()-> @model
  template: RL.JST 'logs'
  ui:
    container: '.container'
    scroll_cmd: 'a'
    input: 'input'
  events:
    'click a': 'onToggleAutoScroll'
    'input input': 'onUpdateFiltering'

  #SELECTABLE PROTOCOL (see SelectableCollectionView)
  select: ()->
    this.$el.removeClass 'hide'
  unselect: ()->
    this.$el.addClass 'hide'

  #UI CALLBACKS
  onUpdateFiltering: (evt)->
    filter = this.ui.input.val()
    filter = filter + String.fromCharCode(evt.which) if evt.which
    this.ui.container.find('code').removeClass 'match'
    unless filter == ''
      this.ui.container.find("code:contains(#{filter})").addClass 'match'

  onToggleAutoScroll: (evt)->
    evt.preventDefault()
    this.stop_auto_scroll = !this.stop_auto_scroll
    if this.stop_auto_scroll
      this.ui.scroll_cmd.removeClass 'active'
    else
      this.ui.scroll_cmd.addClass 'active'

  #STREAMING MANAGEMENT
  onBeforeClose: ()->
    this.stop_streaming()
  onItemRendered: ()->
    this.start_streaming()

  stop_streaming: ()->
    this.source.close() if this.source
  start_streaming: ()->
    return false if this.source
    this.source = new EventSource RL.relPath("logs/#{this.model.get('name')}")

    me = this
    this.source.addEventListener 'error', (e)->
      if this.readyState == EventSource.CLOSED
        me.logError 'Connection lost...'
      else
        me.logError 'Connection error... Auto reconnect'
    this.source.addEventListener 'logs.all', (e) =>
      me.logError 'Reconnected' if this.error
      this.error = false
      markdown = $.parseJSON(e.data)
      matching = 'match' if !!this.filter && markdown.indexOf(this.filter) != -1
      me.logHtml "<pre class='prettyprint'><code class='#{matching}'>#{markdown}</code></pre>"
    true

  #LOGGERS
  logError: (error)->
    return if this.error
    this.error = true
    this.logHtml "<span class='stream_error'>#{error}</span>"
  logHtml: (html)->
    this.ui.container.append(html).scrollTop 10000 unless !!this.stop_auto_scroll