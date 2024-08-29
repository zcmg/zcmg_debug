RegisterCommand('teste',function()
    TriggerEvent('zcmg_debug:Send2Discord', GetCurrentResourceName(), 'teste99')
end)

RegisterServerEvent('zcmg_debug:Send2Discord')
AddEventHandler('zcmg_debug:Send2Discord', function(resourcename, text)
    -- local trigger

    -- AddEventHandler("gameEventTriggered", function(event, data)
    --     trigger = event
    --     print(event)

    -- end)

   print('Logs de debug enviada para o discord')

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, "POST",
		json.encode({ embeds = { { author = { name = resourcename, url = "https://fenixhub.dev/",
			icon_url = "https://cdn.discordapp.com/attachments/636955559626670080/795310131704627231/logo-fen.png" },
			title = "Debug Resource: "..resourcename.."Version",
			description = " FenixAC Started successful  \n  \n"..GetResourceMetadata(GetCurrentResourceName(), 'version').."\n  \n Fenix_DevHub "" - " .. os.date(" %x  %X  %p"), color = 16711680, } } }),
		{ ["Content-Type"] = "application/json" })

end)
