--------------------------------------------------------------------------------
--  Handler.......... : onJoypadButtonPressureChange
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaGame.onJoypadButtonPressureChange ( nJoypad, nButton, nPressure )
--------------------------------------------------------------------------------
	
    --
    -- These map directly to xbox controller constants 
    -- OUYA vs Xbox controller
    -- O == A
    -- A == B
    -- U == X
    -- Y == y
    --
    
    local nColumn
        if nButton == input.kJoypadButtonXbox360A then nColumn = 5
    elseif nButton == input.kJoypadButtonXbox360B then nColumn = 6
    elseif nButton == input.kJoypadButtonXbox360X then nColumn = 7
    elseif nButton == input.kJoypadButtonXbox360Y then nColumn = 8
    elseif nButton == input.kJoypadButtonXbox360Up then nColumn = 9
    elseif nButton == input.kJoypadButtonXbox360Down then nColumn = 10
    elseif nButton == input.kJoypadButtonXbox360Left then nColumn = 11
    elseif nButton == input.kJoypadButtonXbox360Right then nColumn = 12
    elseif nButton == input.kJoypadButtonXbox360Start then nColumn = 13
    elseif nButton == input.kJoypadButtonXbox360LShoulder then nColumn = 14
    elseif nButton == input.kJoypadButtonXbox360RShoulder then nColumn = 15
    elseif nButton == input.kJoypadButtonXbox360LTrigger then nColumn = 16
    elseif nButton == input.kJoypadButtonXbox360RTrigger then nColumn = 17
    elseif nButton == input.kJoypadButtonXbox360LThumb then nColumn = 18
    elseif nButton == input.kJoypadButtonXbox360RThumb then nColumn = 19
    end
        
	local hList = hud.getComponent ( this.getUser ( ), "hud.List" )
    hud.setListItemTextAt ( hList, nJoypad + 1, nColumn, nPressure )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
