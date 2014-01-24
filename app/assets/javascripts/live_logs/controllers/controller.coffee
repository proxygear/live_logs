class RL.Controller
  root: ()->
    $(this.app.modal.el).foundation 'reveal', 'close'
  new_tab: ()->
    file_list = new RL.ServerLogFiles
    tab_form = new RL.TabForm model: file_list
    this.app.modal.show tab_form
    $(this.app.modal.el).foundation 'reveal', 'open'
  settings: ()->
    alert 'settings'
  # unselect_tabs: ()=>
  #   console.log('unselect_tabs')
  #   $('#tabs li').removeClass 'active'
  # show_logs_view: (v)=>
  #   console.log 'show_logs_view'
  #   console.log v
  #   this.app.logs.show v

RL.addInitializer ()->
  controller = new RL.Controller()
  RL.router = new RL.Router controller: controller
  controller.app = this
  #RL.vent.on 'unselect_tabs', controller.unselect_tabs
  #RL.vent.on 'show_logs_view', controller.show_logs_view
  RL.vent.trigger 'routing:started'