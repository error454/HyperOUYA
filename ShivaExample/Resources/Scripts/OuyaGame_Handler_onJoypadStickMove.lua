--------------------------------------------------------------------------------
--  Handler.......... : onJoypadStickMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaGame.onJoypadStickMove ( nJoypad, nStick, nAxisX, nAxisY )
--------------------------------------------------------------------------------
	
    --
    -- nJoypad is from 0 - X
    -- nStick is 0 for left analog, 1 for right analog
    -- nAxisX and nAxisY are [-1, 1]
    --
    
	local hList = hud.getComponent ( this.getUser ( ), "hud.List" )
    local nItem = nJoypad + 1
    
    -- 1/2, 3/4
    local nColumn = nStick == 0 and 1 or 3
    
    hud.setListItemTextAt ( hList, nItem, nColumn, "" .. math.trunc ( nAxisX, 2 ) )
    hud.setListItemTextAt ( hList, nItem, nColumn + 1, "" .. math.trunc ( nAxisY, 2 ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
