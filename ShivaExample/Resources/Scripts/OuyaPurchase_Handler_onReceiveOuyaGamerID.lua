--------------------------------------------------------------------------------
--  Handler.......... : onReceiveOuyaGamerID
--  Author........... : 
--  Description...... : Called when onRequestOuyaGamerID completes
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function OuyaPurchase.onReceiveOuyaGamerID ( sID )
--------------------------------------------------------------------------------
	
	if(not string.isEmpty ( sID ))
    then
        log.message ( "Received gamer ID of: "..sID )
        this.sGamerID ( sID)
        user.sendEvent ( this.getUser ( ), "HighScoreAI", "onSetGamerID", sID )
        user.sendEvent ( this.getUser ( ), "ConsoleAI", "onSetID", sID )
    else
        log.message ( "Couldn't retrieve gamer id" )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
