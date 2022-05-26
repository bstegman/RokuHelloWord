'-------------------------------------------------------------------------------
' init
'-------------------------------------------------------------------------------
Sub init()

	m.top.backgroundColor = "#000000"
	m.top.backgroundUri = ""

	m.router = m.top.findNode("Router")
    m.router.loggingEnabled = false
	m.router.ObserveFieldScoped("screenChange", "onScreenChange")
	m.router.callFunc("setScreens", {screens:m.global.screens})
	m.router.callFunc("showScreen", {screen:m.global.screens.LoginScreen, trackHistory:true})
End Sub

'-------------------------------------------------------------------------------
' onScreenChange
'-------------------------------------------------------------------------------
Sub onScreenChange(evt as Object)

	screenChange = evt.getData()
    from = "invalid"
    if TYPE_isValid(screenChange.from)

        from = screenChange.from.id
    end if

	print "ROUTER: - Changing screen from " + from + " to " + screenChange.to.id
End Sub