using build
class Build : build::BuildPod {
  new make() {
    podName   = "uploaderExt"
    version   = Version( [ 1, 0, 0 ] )
    summary   = ""
    srcDirs   = [`fan/`, `fan/ui/`]
    outPodDir = Env.cur.homeDir.uri + `lib/fan/`
    depends   = ["sys 1.0",
                 "afBson 0+",
                 "db 1.0",
                 "imageExt 1.0",
                 "fui 1.0",
                 "fwt 1.0",
                 "gfx 1.0",
                 "proj 1.0",
                 "web 1.0",
                 "webfwt 1.0"]
    index    = ["proj.ext": "uploaderExt::UploaderExt"]
  }
}
