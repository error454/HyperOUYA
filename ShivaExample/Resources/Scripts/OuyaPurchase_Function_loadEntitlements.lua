--------------------------------------------------------------------------------
--  Function......... : loadEntitlements
--  Author........... : 
--  Description...... : Loads entitlements from disk.  You should set states here
--                      based on what is found.  If the user is offline, this may
--                      be the only way to determine if they've purchased the game.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.loadEntitlements ( )
--------------------------------------------------------------------------------
	
    application.loadCurrentUserEnvironment ( this.sEnvironmentName ( ) )
    
    --
    -- Example of how you might set the purchased state.  This would have been saved
    -- previously in rewardReceipts( )
    --
    local bIsPurchased = application.getCurrentUserEnvironmentVariable ( "Entitlement.Purchased" )

    if(bIsPurchased and bIsPurchased == true)
    then
        log.message ( "entitlement was found in save game data" )
        this.bSaveDataSaysPurchased ( true )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
