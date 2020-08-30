resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'OurStory RPs Morphine Injector'

server_scripts 
{
'@vrp/lib/utils.lua',
	'server.lua',
}

client_scripts 
{
'@vrp/client/Tunnel.lua',
'@vrp/client/Proxy.lua',
	'client.lua',
}