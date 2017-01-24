addEvent("loginSuccess",true)
addEvent("loginFailed",true)

function checkAccount()
	local accFile = fileOpen(getPlayerName(localPlayer)..".txt")
	if fileExists(getPlayerName(localPlayer)..".txt") then
		hash = fileRead(accFile, 65)
		triggerServerEvent("logPlayerIn", localPlayer, localPlayer, hash)
	else
		guiSetVisible(login_main, true)
		showCursor(true,true)
		showChat(false)
	end
	fileClose(accFile)
end
addEventHandler("onClientResourceStart", resourceRoot, checkAccount)

function onLoginFailed()
	outputChatBox("Login Failed, wrong Password!")
	guiSetText(pwlabel,"Login Failed, wrong Password!")
	guiSetVisible(login_main, true)
	showCursor(true,true)
	showChat(false)
end
addEventHandler("loginFailed", resourceRoot, onLoginFailed)

function onLoginSuccess(hash)
	guiSetVisible(login_main,false)
	showCursor(false,true)
	showChat(true)
	pwfile = fileCreate(getPlayerName(localPlayer)..".txt")
	fileWrite(pwfile, hash)
	fileClose(pwfile)
end
addEventHandler("loginSuccess", resourceRoot, onLoginSuccess)
