using proj
using util
using web

@ExtMeta {
  name = "home"
  app = homeExt::HomeApp#
  icon = "home-50.png"
}

const class HomeExt : Ext, Weblet {
  
  override Void onGet() {
    type := req.modRel.path.first
    switch ( type ) {
      default: res.sendErr( 404 ); return
    }
    res.headers[ "Content-Type" ] = "text/plain"
  }
}
