function guiClickHandler(btn,state)
	if btn == "left" then
			pw = guiGetText(pwedit)
			pw = sha256(pw)
			
			triggerServerEvent("tryLoginorRegister", localPlayer, localPlayer, pw)
	end
end


addEventHandler("onClientResourceStart", resourceRoot,
    function()
        login_main = guiCreateWindow(0.41, 0.41, 0.18, 0.17, "Login /  Register", true)
        guiWindowSetMovable(login_main, false)
        guiWindowSetSizable(login_main, false)

        donebtn = guiCreateButton(0.27, 0.73, 0.46, 0.19, "Done", true, login_main)
        guiSetProperty(donebtn, "NormalTextColour", "FFAAAAAA")
        pwedit = guiCreateEdit(0.09, 0.39, 0.84, 0.23, "", true, login_main)
        guiEditSetMasked(pwedit, true)
        pwlabel = guiCreateLabel(0.09, 0.29, 0.68, 0.16, "Password:", true, login_main)    
		guiSetVisible(login_main,false)
		addEventHandler("onClientGUIClick", donebtn, guiClickHandler,false)
	end
)


