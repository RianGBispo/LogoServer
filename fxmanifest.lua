fx_version("cerulean")
game("rdr3")
rdr3_warning("I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.")

ui_page("html/index.html")
files({ "html/index.html", "html/logo.png" })
client_script("client.lua")
