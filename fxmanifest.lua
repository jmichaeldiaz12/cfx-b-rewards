-- fxmanifest.lua

fx_version 'cerulean'
game 'gta5'

author 'Blaise DeRozan'
description 'Reward Players with Items on Kill'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'config.lua', 
    'server.lua'
}

dependencies {
    'es_extended', 
    'ox_inventory'
}
