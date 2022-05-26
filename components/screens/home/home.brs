'-------------------------------------------------------------------------------
' init
'-------------------------------------------------------------------------------
Sub init()
  m.resolution = UI_Resolution()
  m.testposter = m.top.findNode ("TestPoster")
  print m.resolution
  m.testposter.width = m.resolution.width
  m.testposter.height = m.resolution.height
End Sub

'-------------------------------------------------------------------------------
' _onScreenWillShow
'
' @description - Called when the screen is about to be shown.  This is
' where you typically want to attach your observers
'-------------------------------------------------------------------------------
Sub _onScreenWillShow()
End Sub

'-------------------------------------------------------------------------------
' _onScreenWillHide
'
' @description - Called when the screen is about to be hidden.  This is
' where you typically want to detach your observers
'-------------------------------------------------------------------------------
Sub _onScreenWillHide()
End Sub

'-------------------------------------------------------------------------------
' _isActive
'
' @description - Called when the screen becomes active
' @param refresh Boolean - Tells the screen that it should refresh all data.
' This is set by the user when switching screens.
'-------------------------------------------------------------------------------
Sub _isActive(refresh=false as Boolean)
End Sub

'-------------------------------------------------------------------------------
' onKeyEvent
'
' @description - Called when there is a key event
'-------------------------------------------------------------------------------
Function onKeyEvent(key as String, press as Boolean) as Boolean

  handled = true
  if press

  keycodes = enum_keycodes()
		if key = keycodes.BACK

			baseHistoryBack()

    else if key = keycodes.OK

      baseShowScreen(m.global.screens.HelloScreen)
		end if
  end if
  return handled
End Function