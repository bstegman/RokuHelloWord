'-------------------------------------------------------------------------------
' Main
'-------------------------------------------------------------------------------
Sub Main(externalParams as object)

    port = CreateObject("roMessagePort")

    screen = CreateObject("roSGScreen")
	screen.setMessagePort(port)
	screen.CreateScene("AppScene")

    m.global = screen.getGlobalNode()

    screens = ParseJson(ReadAsciiFile("pkg:/configs/screens.json"))
    m.global.AddFields({screens:screens})

	screen.show()

    while(true)

        message = wait(0, port)
        if message <> invalid

            messageType = type(message)
            if messageType = "roSGScreenEvent"

            	if message.isScreenClosed() then exit while
            end if
        end if
	end while
End Sub