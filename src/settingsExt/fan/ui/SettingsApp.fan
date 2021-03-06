using dom
using fui
using fwt
using gfx
using util
using webfwt

@Js
class SettingsApp : App {
  [Str:Str]? contentData { private set }
  Str:SettingsPane listMap := [
      DatabasePane.listName : DatabasePane( this ),
      ServerPane.listName : ServerPane( this )
    ] { private set }
  private BorderPane pageContent := BorderPane()
  
  private TreeList list := TreeList {
    prefw = 300
    it.items = listMap.keys
    it.onSelect.add |e| {
      selected := list.selected[0]
      apiCall( Fui.cur.baseUri + "api/settings?option=$selected".toUri ).get |res| {
        list.selected[0] = selected
        contentData = ( (Str:Obj?) JsonInStream( res.content.in ).readJson ).map |Obj? o->Str| { o?.toStr ?: "" }
        listMap[ selected ].getData
        modifyState
      }
    }
  }
  
  new make() : super() {
    content = EdgePane {
      left = list
      center = ScrollPane {
        InsetPane {
          insets = Insets( 10 )
          pageContent,
        },
      }
    }
    relayout
  }
  
  override Void onSaveState( State state ) {
    state[ "listSelected" ] = list.selectedIndex
    state[ "contentData" ] = contentData
    listMap[ list.selected[0] ].onSaveState( state )
  }
  
  override Void onLoadState( State state ) {
    list.selectedIndex = state[ "listSelected" ]
    contentData = ( ([Str:Obj?]?) state[ "contentData" ] )?.map |Obj? o->Str| { o?.toStr ?: "" }
    if ( contentData != null ) listMap[ list.selected[0] ].onLoadState( state )
    if ( list.selectedIndex != null ) pageContent.content = listMap[ list.selected[0] ]
    pageContent.relayout
  }
}
