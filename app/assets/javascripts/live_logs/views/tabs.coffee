class RL.Tabs extends RL.SelectableCollectionView
  itemView: RL.Tab
  tagName: 'ul'
  empty: ()->
    _tabs = $('#tabs')
    _tabs.fadeOut() if _tabs.is ':visible'
  notEmpty: ()->
    _tabs = $('#tabs')
    _tabs.fadeIn() unless _tabs.is ':visible'