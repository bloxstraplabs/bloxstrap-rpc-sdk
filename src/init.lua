--!strict

-- BloxstrapRPC Helper Module v1.0.1
-- Written by pizzaboxer (@xtremeguy2256) and Epix (@ElusiveEpix)
-- Types reflected from https://github.com/pizzaboxer/bloxstrap/tree/main/Bloxstrap/Models/BloxstrapRPC
-- Further documentation is available at https://github.com/pizzaboxer/bloxstrap/wiki/Integrating-Bloxstrap-functionality-into-your-game

local HttpService = game:GetService("HttpService")

local BloxstrapRPC = {}

export type RichPresence = {
	details: string?,
	state: string?,
	timeStart: number?,
	timeEnd: number?,
	smallImage: RichPresenceImage?,
	largeImage: RichPresenceImage?,
}

export type RichPresenceImage = {
	assetId: number?,
	hoverText: string?,
	clear: boolean?,
	reset: boolean?,
}

function BloxstrapRPC.SendMessage(command: string, data: any)
	local json = HttpService:JSONEncode({
		command = command,
		data = data,
	})

	print("[BloxstrapRPC] " .. json)
end

function BloxstrapRPC.SetRichPresence(data: RichPresence)
	if data.timeStart ~= nil then
		data.timeStart = math.round(data.timeStart)
	end

	if data.timeEnd ~= nil then
		data.timeEnd = math.round(data.timeEnd)
	end

	BloxstrapRPC.SendMessage("SetRichPresence", data)
end

return BloxstrapRPC
