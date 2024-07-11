fx_version 'cerulean'
game 'gta5'
version '1.0.1'

name 'qbx_density'
description 'Population management'
repository 'https://github.com/Qbox-project/qbx_density'
version '1.0.1'

client_scripts {
    '@ox_lib/init.lua',
    'client/main.lua'
}

files {
    'config/client.lua'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
