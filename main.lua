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


local function gotoDisclaimer( event )
	composer.gotoScene( "Pages.DisclaimerPage" )
end

local function gotoHomepage( event )
	composer.gotoScene( "Pages.Homepage" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end

local function trackProgress()
	composer.gotoScene("Pages.recordProgress.menu",{effect="slideLeft"})

end

local function recordProgress()
	composer.gotoScene("Pages.recordProgress.menu",{effect="slideLeft"})
end

globalvar.showTabbar = 0
print(globalvar.showTabbar)

		local myRectangle = display.newRect( CentreX, 10, ScreenWidth, 70 )
		myRectangle:setFillColor( 0,0.62,0.451,1 )

local function checkTabbar()
	if globalvar.showTabbar == 1 then

		local tabButtons = {
			{ label="Homepage", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=gotoHomepage, selected=true },
			{ label="Track progress", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=trackProgress },
			{ label="Record progress", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=recordProgress },
		}

		local tabBar = widget.newTabBar{
			top = display.contentHeight - 30,	
			buttons = tabButtons
		}
		

		
	end
end
Runtime:addEventListener( "enterFrame", checkTabbar )

gotoDisclaimer()
