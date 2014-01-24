class RL.LogFiles extends Backbone.Collection
  model: (attrs, options)=>
    new RL.LogFile(attrs, options)