build : db proj fui homeExt loginExt settingsExt securityExt pagesExt userExt dockTestExt themesExt

run : build
	- bin/fcms

db :
	- cd src/db; ../../bin/fan build.fan

proj :
	- cd src/proj; ../../bin/fan build.fan

fui :
	- cd src/fui; ../../bin/fan build.fan

pagesExt :
	- cd src/pagesExt; ../../bin/fan build.fan

dockTestExt :
	- cd src/dockTestExt; ../../bin/fan build.fan

homeExt :
	- cd src/homeExt; ../../bin/fan build.fan

loginExt :
	- cd src/loginExt; ../../bin/fan build.fan

settingsExt :
	- cd src/settingsExt; ../../bin/fan build.fan

userExt :
	- cd src/userExt; ../../bin/fan build.fan

securityExt :
	- cd src/securityExt; ../../bin/fan build.fan

themesExt :
	- cd src/themesExt; ../../bin/fan build.fan
