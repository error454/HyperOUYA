--------------------------------------------------------------------------------
--  Handler.......... : onRequestOuyaPurchaseByID
--  Author........... : 
--  Description...... : Requests a purchase for the specified product ID
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.onRequestOuyaPurchaseByID ( sID  )
--------------------------------------------------------------------------------
	
	local nIndex = hashtable.get ( this.htProductIDs ( ), sID )
    log.message ( "Requesting purchase for ", sID, " ", nIndex )
    if(nIndex and nIndex >= 0) then
        this.requestPurchase ( nIndex )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
