--[[
Name: script-hud
Author: AroSly
Script for: GTAO.PL
Stare kody w serwer side.
]]--



local screenW, screenH = guiGetScreenSize()
local baseX = 1920
local zoom = 1.0 -- jak bardzo interfejs ma byc zmniejszony 
local minZoom = 2 -- najwieksze zmniejszenie 
if screenW < baseX then -- jesli rozdzielczosc jest mniejsza niz full hd to stopniowo zmniejszamy interfejs 
 zoom = math.min(minZoom, baseX/screenW)
end 

local renderData = {} -- tylko zmienna tablicowa

renderData.background = { -- wszystko to oddzielnie kazdy element
 x = (screenW/2)-(768/zoom)/2+(450/zoom),
 y = (screenH/2)-(480/zoom)/2+(250/zoom),
 w = 768/zoom,
 h = 480/zoom,
}




-- local bgPos = {x=(screenW/2)-(768/zoom)/2, y=(screenH/2)-(480/zoom)/2, w=768/zoom, h=480/zoom}

-- local titleTextPos = {x=bgPos.x, y=bgPos.y, w=bgPos.w+bgPos.x, h=bgPos.y+105/zoom}
-- local descTextPos = {x=bgPos.x+135/zoom, y=bgPos.y, w=bgPos.w+bgPos.x-135/zoom, h=bgPos.h+bgPos.y-105/zoom}

local w = dxGetTextWidth( getPlayerName( getLocalPlayer(  ) ), 2.0, "default-bold"  )
local h = dxGetFontHeight( 2.0, "default-bold" )



addEventHandler("onClientResourceStart", resourceRoot, function()
 showPlayerHudComponent("ammo", false)
 showPlayerHudComponent("armour", false)
 showPlayerHudComponent("breath", false)
 showPlayerHudComponent("clock", false)
 showPlayerHudComponent("health", false)
 showPlayerHudComponent("money", false)
 showPlayerHudComponent("weapon", false)
 showPlayerHudComponent("wanted", false)
end)

addEventHandler("onClientRender", root, function()
 local text = "Nick: "..getPlayerName(localPlayer)
 local money = ""..string.format("%07d", getPlayerMoney())
 local w = dxGetTextWidth( text, 2.0/zoom, "default-bold"  )
 local h = dxGetFontHeight( 2.0/zoom, "default-bold" )
 local time= getRealTime()
 --local hours = time.hour
 --local minutes = time.minute
 local hours = string.format("%02d",time.hour)
 local minutes = string.format("%02d",time.minute)



 local bg = renderData.background
 -- x= lewo,prawo y= góra,dół w= Długośc h= Grób
 dxDrawImage(bg.x-(-330/zoom), bg.y-(570/zoom), w-(-420/zoom), h-(-300/zoom), "i/bg_czaple.png")
 dxDrawText("Nick:", bg.x-(-460/zoom), bg.y-(450/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText("Ping:", bg.x-(-460/zoom), bg.y-(420/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText("Życie:", bg.x-(-460/zoom), bg.y-(390/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText("Czas:", bg.x-(-460/zoom), bg.y-(360/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText("PLN", bg.x+(660/zoom), bg.y-(310/zoom), w, h, tocolor(255,255,255,255),2.0/zoom, "default-bold")
 dxDrawText(money, bg.x-(-560/zoom), bg.y-(310/zoom), w, h, tocolor(255,255,255,255),2.0/zoom, "default-bold")
 dxDrawText(getPlayerName(localPlayer), bg.x-(-520/zoom), bg.y-(450/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText(getPlayerPing(localPlayer), bg.x-(-520/zoom), bg.y-(420/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText(math.floor(getElementHealth(localPlayer)).."%", bg.x-(-520/zoom), bg.y-(390/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
 dxDrawText(hours..":"..minutes, bg.x-(-520/zoom), bg.y-(360/zoom), w, h, tocolor(255,255,255,255),1.5/zoom, "default-bold")
end)
