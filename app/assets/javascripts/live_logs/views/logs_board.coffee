class RL.LogsBoard extends RL.SelectableCollectionView
  itemView: RL.Logs
  empty: ()->
    _tabs = $('#board')
    _tabs.fadeOut() if _tabs.is ':visible'
  notEmpty: ()->
    _tabs = $('#board')
    _tabs.fadeIn() unless _tabs.is ':visible'