ESX = exports["es_extended"]:getSharedObject()

RegisterCommand("losowanie", function(source, args, rawCommand)
    if source == 0 then
        local gracze = GetPlayers()
        if #gracze > 0 then
            local randomIndex = math.random(1, #gracze)
            local randomosoba = gracze[randomIndex]
            local xPlayer = ESX.GetPlayerFromId(tonumber(randomosoba))

            if xPlayer then
                if args[1] and tonumber(args[2]) then
                    local id = randomosoba
                    local nick = GetPlayerName(randomosoba)
                    local licencja = xPlayer.getIdentifier()
                    local permisje = xPlayer.getGroup()
                    local discord = GetPlayerIdentifier(randomosoba, 'discord:')
                    if discord == nil then
                        discord = 'BRAK' 
                    end

                    print(string.format(
                        'WYLOSOWANO: %s\nCOPY COMMAND: giveitem %s %s %s\nUżyto komendy: /losowanie %s %s\n**WYLOSOWANA OSOBA**\nID: %s\nNICK: %s\nLICENCJA: %s\nPERMISJE: %s\nDISCORD ID: %s',
                        id, id, args[1], args[2], args[1], args[2], id, nick, licencja, permisje , discord
                    ))
                else
                    print('Brak poprawnych argumentów! Użycie: /losowanie [item] [ilość]')
                    
                end
            else
                print('Nie można znaleźć gracza o ID: ' .. tostring(randomosoba))
            end
        else
            print('Brak graczy online do wylosowania.')
        end
    end
end)
