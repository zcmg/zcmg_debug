RegisterServerEvent('zcmg_debug:write_to_file')
AddEventHandler('zcmg_debug:write_to_file', function(resourcename, print)
  textWrite(resourcename, print)
end)


function textWrite(resourcename, text)
	log = io.open("resources/"..GetCurrentResourceName().."/logs/"..resourcename..".txt", "a++")
	local date_time_string  = os.date('%Y-%m-%d %H:%M:%S', os.time()).. " - ".. text
	print(date_time_string)
	log:write(date_time_string)
	log:close()
end
