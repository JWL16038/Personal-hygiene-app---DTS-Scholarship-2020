-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.DefaultStatusBar )

local widget = require("widget")
local composer = require("composer")
local globalvar = require("globalvar")

local ScreenWidth = display.contentWidth
local ScreenHeight = display.contentHeight
local CentreX = display.contentCenterX
local CentreY = display.contentCenterY 

local menuBarIcon

local function gotoDisclaimer( event )
	composer.gotoScene( "Pages.DisclaimerPage" )
end


local function showMenuBar()
	local options = {
		isModal = true,
		effect = "slideRight",
		time = 300,
	}
	composer.showOverlay( "Pages.SidebarMenu", options )
	menuBarIcon.isVisible = false
end


menuBarIcon = display.newImage("Images/Icons/hamburger-menu-icon-svg-16.jpg")
menuBarIcon:translate( CentreX - 130, 20 )
menuBarIcon:scale(0.10,0.10)

function menuBarIcon:touch( event )
	if event.phase == "ended" then
		showMenuBar()
	return true
	end
end
menuBarIcon:addEventListener( "touch", menuBarIcon )



gotoDisclaimer()
