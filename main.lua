-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.DefaultStatusBar )

local widget = require("widget")
local composer = require("composer")

local function gotoDisclaimer( event )
	composer.gotoScene( "Pages.DisclaimerPage" )
end

local function gotoHomepage( event )
	composer.gotoScene( "Pages.Homepage" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end



--[[
local tabButtons = {
	{ label="Homepage", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=gotoHomepage, selected=true },
	{ label="Track progress", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onSecondView },
	{ label="Record progress", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onSecondView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 30,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}]]--

gotoDisclaimer()


