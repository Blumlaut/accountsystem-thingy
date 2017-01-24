generalPW = "UjF2kVPW"


function logPlayerIn(thePlayer,hash)
	if thePlayer and hash then
		if getAccount(getPlayerName(thePlayer)) then
			if hash == getAccountData(getAccount(getPlayerName(thePlayer)), "user.password") then
				logIn(thePlayer, getAccount(getPlayerName(thePlayer)),generalPW)
				triggerClientEvent(thePlayer, "loginSuccess",resourceRoot,hash)
			end
		end
	end
end
addEvent("logPlayerIn",true)
addEventHandler("logPlayerIn", root,logPlayerIn)


function tryLoginorRegister(thePlayer,hash)
	if thePlayer and hash then
		if getAccount(getPlayerName(thePlayer)) then
			if hash == getAccountData(getAccount(getPlayerName(thePlayer)), "user.password") then
				logIn(thePlayer, getAccount(getPlayerName(thePlayer)),generalPW)
				triggerClientEvent(thePlayer, "loginSuccess",resourceRoot,hash)
			end
		else
			acc = addAccount(getPlayerName(thePlayer),generalPW)
			setAccountData(acc,"user.password", hash)
			logPlayerIn(thePlayer,UjF2kVPW)
		end
	end
end
addEvent("tryLoginorRegister",true)
addEventHandler("tryLoginorRegister",root,tryLoginorRegister)




function checkforcommands(command)
	if command == "login" then
		cancelEvent()
	end
	if command == "logout" then
		cancelEvent()
		kickPlayer(source, "Logging Out")
	end
	
	
	
end
addEventHandler("onPlayerCommand", root, checkforcommands)
