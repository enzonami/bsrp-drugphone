
fx_version 'cerulean'
game 'gta5'

lua54 'yes' -- Enables Lua 5.4 features

name 'bsrp-drugphone'
description 'A rewritten dynamic drug-selling script'
author 'Enzonami + Optimized'
version '2.0.0'

shared_script '@ox_lib/init.lua'

server_scripts {
    'config.lua',
    'server/*.lua'
}

client_scripts {
    'config.lua',
    'client/*.lua'
}

dependencies {
    'ox_lib',
    'ox_inventory',
    'ox_target'
}
