fx_version 'cerulean'
author '# amari_javil'
Description 'A Jewelry Store job script by Amari Javil.'
game 'gta5'

shared_scripts { 
    "config/**.lua",
}

server_script { 
    "@oxmysql/lib/MySQL.lua",
    "server/**.lua",
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    "client/**.lua",
}

dependencies {
    'qb-core',
    'PolyZone',
    'qb-menu'
}
