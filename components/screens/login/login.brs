'-------------------------------------------------------------------------------
' init
'-------------------------------------------------------------------------------
Sub init()

    m.pageTitle = m.top.findNode("pageTitle")
    m.list = m.top.findNode("list")
    UI_Screen_PlaceNodeCenter(m.list)
End Sub

'-------------------------------------------------------------------------------
' _onScreenWillShow
'
' @description - Called when the screen is about to be shown.  This is
' where you typically want to attach your observers
'-------------------------------------------------------------------------------
Sub _onScreenWillShow()

    m.list.ObserveFieldScoped("itemSelected", "onListItemSelected")
End Sub

'-------------------------------------------------------------------------------
' _onScreenWillHide
'
' @description - Called when the screen is about to be hidden.  This is
' where you typically want to detach your observers
'-------------------------------------------------------------------------------
Sub _onScreenWillHide()

    m.list.UnObserveFieldScoped("itemSelected")
End Sub

'-------------------------------------------------------------------------------
' _isActive
'
' @description - Called when the screen becomes active
' @param refresh Boolean - Tells the screen that it should refresh all data.
' This is set by the user when switching screens.
'-------------------------------------------------------------------------------
Sub _isActive(refresh=false as Boolean)

    baseFocusNode(m.list.id)
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
		end if
    end if
    return handled
End Function

'-------------------------------------------------------------------------------
' onListItemSelected
'-------------------------------------------------------------------------------
Sub onListItemSelected(evt as Object)


    item = m.list.content.getChild(evt.getData())
    print item

    if item.id = "item-1"

        baseShowScreen(m.global.screens.HomeScreen)

    else if item.id = "item-2"

        baseShowScreen(m.global.screens.HelloScreen)

    else if item.id = "item-3"

        baseShowScreen(m.global.screens.AppScreen)

    end if
End Sub