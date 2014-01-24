class RL.TabForm extends Marionette.ItemView
  template: RL.JST 'tab_form'
  ui:
    file_name: 'select[name="file_name"]'
  events:
    'submit form': 'submit'
  serializeData: ()-> this.model
  onRender: ()->
    this.ui.file_name.focus()
  initialize: (options)->
    this.listenTo @model, 'change', this.refreshSelect
    @model.fetch()
  submit: (event)->
    event.preventDefault()
    matcher = new RL.LogFile name: this.ui.file_name.val()
    RL.logs.add matcher
    RL.router.navigate '#', trigger: true
  refreshSelect: ()->
    this.ui.file_name.find('option').remove()
    for n in this.model.get('names')
      this.ui.file_name.append "<option value='#{n}'>#{n}</option>"