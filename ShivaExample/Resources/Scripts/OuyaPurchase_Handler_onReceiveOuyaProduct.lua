--------------------------------------------------------------------------------
--  Handler.......... : onReceiveOuyaProduct
--  Author........... : 
--  Description...... : This is called once for every product received in the product list.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.onReceiveOuyaProduct ( sID, sProductName, nCostInCents )
--------------------------------------------------------------------------------
	
	log.message ( "Received ouya product:" )
    log.message ( "ID: "..sID .. " Name: "..sProductName.." cost: "..nCostInCents  )
	
    if(string.isEmpty ( sID ) and string.isEmpty ( sProductName ) and nCostInCents == 0)
    then
        log.message ( "no products received" )
    elseif(sID == "done") then
        log.message ( "All products received!" )
        -- send an alert here if you want
    else
        table.add ( this.tProductID ( ), sID )
        table.add ( this.tProductName ( ), sProductName )
        table.add ( this.tProductCost ( ), nCostInCents )
        
        -- Store the product ID along with its index in the product tables
        hashtable.add ( this.htProductIDs ( ), sID, hashtable.getSize ( this.htProductIDs ( ) ) )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
