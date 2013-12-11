--------------------------------------------------------------------------------
--  Handler.......... : onSetPurchasedState
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaGame.onSetPurchasedState ( bPurchased )
--------------------------------------------------------------------------------
	
	log.message ( "Game purchase state is: ", bPurchased )
	local hPurchased = hud.getComponent ( this.getUser ( ), "hud.PurchaseState" )
    local sState = bPurchased and "PURCHASED" or "NOT PURCHASED"
    hud.setLabelText ( hPurchased, "Purchase State:\n" .. sState )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
