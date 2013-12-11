--------------------------------------------------------------------------------
--  Function......... : rewardConsumable
--  Author........... : 
--  Description...... : When a consumable item is purchased, this is what gets called.
--                      Reward the user based on the id.  The id will be whatever you
--                      set in the OUYA portal.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.rewardConsumable ( nIndex )
--------------------------------------------------------------------------------
	    
	local id = table.getAt ( this.tProductID ( ), nIndex )
    if not id then return 0 end
    
    log.message ( "Consumable ", id, " has been purchased." )
    
    if id == "GAME_GOLD" then
        -- An example of how you might reward a gold consumable
        local nGold = application.getCurrentUserEnvironmentVariable ( "Gold" )
        application.setCurrentUserEnvironmentVariable ( "Gold", nGold + 1000 )
        application.saveCurrentUserEnvironmentVariable ( "Gold" )
    elseif id == "GAME_BLAH" then
       -- .....
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
