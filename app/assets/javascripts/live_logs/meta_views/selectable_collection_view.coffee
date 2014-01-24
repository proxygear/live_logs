class RL.SelectableCollectionView extends Marionette.CollectionView
  collectionEvents:
    'remove': 'onModelRemoved'
    'add': 'onModelAdded'
    'selected': 'onModelSelected'
  onModelRemoved: (model, coll, opt)->
    index = opt.index
    index = coll.length - 1 if index >= coll.length
    if toSelect = coll.at(index)
      this.children.each (v)->
        if v.model == toSelect
          v.select()
        else
          v.unselect()
    this.empty() if coll.length == 0 && this.empty
  onModelAdded: (model, coll, opt)->
    this.children.each (v)->
      v.unselect()
    this.notEmpty() if coll.length > 0 && this.notEmpty
  onModelSelected: (model)->
    this.children.each (v)->
      if v.model == model
        v.select()
      else
        v.unselect()