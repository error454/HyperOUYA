--------------------------------------------------------------------------------
--  Function......... : rewardReceipts
--  Author........... : 
--  Description...... : When a user purchases an entitlement, this is what will get called.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.rewardReceipts ( )
--------------------------------------------------------------------------------
	
    --
    -- Example of how you might determine if your game is purchased.
    -- Pretend your entitlement ID is TEST_ENTITLEMENT
    --
	local bFoundBaseGame = false
    local bFoundEntitlementMisc = false
    
    for i = 0, table.getSize ( this.tEntitlementID ( ) ) - 1 do
        local sEntitlement = table.getAt ( this.tEntitlementID ( ), i )
        if sEntitlement == "TEST_ENTITLEMENT" then
            bFoundBaseGame = true
        elseif sEntitlement == "MISC_ENTITLEMENT" then
            bFoundEntitlementMisc = true
        end
    end
    
    --
    -- Optionally, cache the purchase state just in case the user starts up in an area where
    -- there's no internet.
    --
    application.setCurrentUserEnvironmentVariable ( "Entitlement.Purchased", bFoundBaseGame )
    application.setCurrentUserEnvironmentVariable ( "Entitlement.Misc", bFoundEntitlementMisc )
    application.saveCurrentUserEnvironmentVariable ( "Entitlement.*" )
    
    --
    -- And/Or, send a notice to the main AI that the game has been purchased.
    --
    user.sendEvent ( this.getUser ( ), "OuyaGame", "onSetPurchasedState", bFoundBaseGame )
    
    --
    -- More example code handling the case where another entitlement has been found
    --
    if bFoundEntitlementMisc then
        -- do something else awesome
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
