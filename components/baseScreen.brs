' Stegman Company LLC. v2.0

'-------------------------------------------------------------------------------
' init
'-------------------------------------------------------------------------------
Sub init()

    scene = m.top.GetScene()
	m.apiRequestManager = scene.findNode("ApiRequestManager")
    m.router = scene.findNode("Router")

    m.__lastFocusedNodeId = ""
End Sub

'-------------------------------------------------------------------------------
' onScreenWillShow
'-------------------------------------------------------------------------------
Sub onScreenWillShow(params as object)

	_onScreenWillShow()
End Sub

'-------------------------------------------------------------------------------
' onScreenWillHide
'-------------------------------------------------------------------------------
Sub onScreenWillHide(params as object)

	_onScreenWillHide()
End Sub

'-------------------------------------------------------------------------------
' isActive - Called when the screen becomes active
'-------------------------------------------------------------------------------
Sub isActive(refresh=false as object)

	_isActive(refresh)
End Sub

'-------------------------------------------------------------------------------
' baseShowScreen
'-------------------------------------------------------------------------------
Sub baseShowScreen(screen as object, params=invalid as object)

	if params = invalid

		params = {}
	end if
	params.screen = screen
	m.router.callFunc("showScreen", params)
End Sub

'-------------------------------------------------------------------------------
' baseHistoryBack
'-------------------------------------------------------------------------------
Sub baseHistoryBack(backTo=invalid)

    history = m.router.callFunc("getHistory")
    if history.screens.Count() > 0

        if m.top.id <> history.screens[0]

            m.router.callFunc("historyBack", {backTo:backTo})
        end if
    end if
End Sub

'-------------------------------------------------------------------------------
' baseFocusNode
' @param nodeId String - The id of the node you want to set focus on
'-------------------------------------------------------------------------------
Sub baseFocusNode(nodeId as String)

    node = m.top.findNode(nodeId)
    if TYPE_isValid(node)

        node.setFocus(true)
        m.__lastFocusedNodeId = nodeId
    end if
End Sub

'-------------------------------------------------------------------------------
' baseFocusLastNode
' @param nodeId String - The nodeId to focus on if there is no last focused node
'-------------------------------------------------------------------------------
Sub baseFocusLastNode(nodeId as String)

    node = baseGetLastFocusedNode()
    if TYPE_isValid(node)

        node.setFocus(true)
    else

        baseFocusNode(nodeId)
    end if
End Sub

'-------------------------------------------------------------------------------
' baseGetLastFocusedNode
' @return The node object if found otherwise invalid if not found
'-------------------------------------------------------------------------------
Function baseGetLastFocusedNode() as Object

    return m.top.findNode(m.__lastFocusedNodeId)
End Function

'-------------------------------------------------------------------------------
' baseCaptureFocus
'-------------------------------------------------------------------------------
Sub baseCaptureFocus()

	item = m.top.findNode("captureFocus")
	if NOT TYPE_isValid(item)

		item = CreateObject("roSGNode", "CaptureFocus")
		m.top.appendChild(item)
	end if
	item.setFocus(true)
End Sub