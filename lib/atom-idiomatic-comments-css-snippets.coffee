AtomIdiomaticCommentsCssSnippetsView = require './atom-idiomatic-comments-css-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomIdiomaticCommentsCssSnippets =
  atomIdiomaticCommentsCssSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomIdiomaticCommentsCssSnippetsView = new AtomIdiomaticCommentsCssSnippetsView(state.atomIdiomaticCommentsCssSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomIdiomaticCommentsCssSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-idiomatic-comments-css-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomIdiomaticCommentsCssSnippetsView.destroy()

  serialize: ->
    atomIdiomaticCommentsCssSnippetsViewState: @atomIdiomaticCommentsCssSnippetsView.serialize()

  toggle: ->
    console.log 'AtomIdiomaticCommentsCssSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
