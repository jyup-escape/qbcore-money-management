local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("showbalances", "サーバー内の全ユーザーの残高を表示します", {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "admin" then
        local players = QBCore.Functions.GetPlayers()

        for _, playerId in ipairs(players) do
            local targetPlayer = QBCore.Functions.GetPlayer(playerId)
            if targetPlayer then
                local citizenId = targetPlayer.PlayerData.citizenid
                local balance = targetPlayer.PlayerData.money["bank"]

                print("Citizen ID: " .. citizenId .. " | Bank Balance: $" .. balance)

                TriggerClientEvent('chat:addMessage', src, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {"Server", "Citizen ID: " .. citizenId .. " | Bank Balance: $" .. balance}
                })
            end
        end
    else
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Server", "このコマンドを使用する権限がありません。"}
        })
    end
end)
