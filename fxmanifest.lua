fx_version 'adamant'

game 'gta5'

shared_script 'shared.lua'
shared_script '@drp_core/managers/networkcallbacks.lua'

client_scripts{
    'config.lua',
    'client.lua',
}

server_scripts{
    'config.lua',
    'server.lua'
}