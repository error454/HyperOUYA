--------------------------------------------------------------------------------
--  Function......... : hudInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaGame.hudInit ( )
--------------------------------------------------------------------------------
	
    local hUser = this.getUser ( )
	hud.newTemplateInstance ( hUser, "OuyaGame", "hud" )
    
    local tLabels = table.newInstance ( )
    table.add ( tLabels, "Controller #" )
    table.add ( tLabels, "LS_X" )
    table.add ( tLabels, "LS_Y" )
    table.add ( tLabels, "RS_X" )
    table.add ( tLabels, "RS_Y" )
    table.add ( tLabels, "O" )
    table.add ( tLabels, "A" )
    table.add ( tLabels, "U" )
    table.add ( tLabels, "Y" )
    table.add ( tLabels, "U" )
    table.add ( tLabels, "D" )
    table.add ( tLabels, "L" )
    table.add ( tLabels, "R" )
    table.add ( tLabels, "System" )
    table.add ( tLabels, "L1" )
    table.add ( tLabels, "R1" )
    table.add ( tLabels, "L2" )
    table.add ( tLabels, "R2" )
    table.add ( tLabels, "L3" )
    table.add ( tLabels, "R3" )
    
    -- Get total length of all strings in table
    local count = table.getSize ( tLabels )
    local nLength = 0
    for i = 0, count - 1 do
        local s = table.getAt ( tLabels, i )
        nLength = nLength + string.getLength ( s )
    end
    
    local hList = hud.getComponent ( hUser, "hud.List" )
    hud.addListItem ( hList, "" )
    hud.addListItem ( hList, "0" )
    hud.addListItem ( hList, "1" )
    hud.addListItem ( hList, "2" )
    hud.addListItem ( hList, "3" )
    
    for i = 0, count - 1 do
        hud.addListColumn ( hList )
        local sText = table.getAt ( tLabels, i )
        local length = string.getLength ( sText )
        hud.setListColumnWidthAt ( hList, i, (length / nLength) * 100 )
        hud.setListItemTextAt ( hList, 0, i, sText )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
