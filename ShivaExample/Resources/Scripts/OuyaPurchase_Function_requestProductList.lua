--------------------------------------------------------------------------------
--  Function......... : requestProductList
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.requestProductList ( )
--------------------------------------------------------------------------------
	
    table.empty ( this.tProductCost ( ) )
    table.empty ( this.tProductID ( ) )
    table.empty ( this.tProductName ( ) )
    hashtable.empty ( this.htProductIDs ( ) )
    
	system.callClientFunction ( "onRequestOuyaProductList" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
