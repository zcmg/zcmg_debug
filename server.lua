RegisterCommand('teste',function()
    TriggerEvent('zcmg_debug:Send2Discord')
end)

RegisterServerEvent('zcmg_debug:Send2Discord')
AddEventHandler('zcmg_debug:Send2Discord', function(resourcename, text)
    local trigger

    AddEventHandler("gameEventTriggered", function(event, data)
        trigger = event
    end)

    -- PerformHttpRequest(Config.Webhook,)

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, "POST",
		json.encode({ embeds = { { author = { name = " zcmg_debug", url = "https://fenixhub.dev/",
			icon_url = "https://cdn.discordapp.com/attachments/636955559626670080/795310131704627231/logo-fen.png" },
			title = "Anticheat Started...",
			description = " FenixAC Started successful  \n  \nVersion: 1.0\n  \n Fenix_DevHub - " .. os.date(" %x  %X  %p"), color = 16711680, } } }),
		{ ["Content-Type"] = "application/json" })

end)
