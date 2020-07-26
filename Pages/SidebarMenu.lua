local composer = require( "composer" )
local scene = composer.newScene()
local sqlite3 = require ( "sqlite3")
local widget = require ("widget")

local ScreenWidth = display.contentWidth
local ScreenHeight = display.contentHeight
local CentreX = display.contentCenterX
local CentreY = display.contentCenterY
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local closeIcon
local buttonYpos = CentreY/2 - 20
 
local function hideMenuBar(event)
	composer.hideOverlay( "slideLeft", 600 )
end 

local function handleButtonEvent1( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
		hideMenuBar()
    end
end

local function handleButtonEvent2( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
		hideMenuBar()
    end
end

local function handleButtonEvent3( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
		hideMenuBar()
    end
end

local function handleButtonEvent4( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
		hideMenuBar()
    end
end

local function handleButtonEvent5( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
		hideMenuBar()
    end
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
  
	local SceneBKG = display.newRect(CentreX - 80,CentreY,ScreenWidth/2,ScreenHeight)
	SceneBKG:setFillColor(0.95)
	sceneGroup:insert(SceneBKG)

 	local TitleText = display.newText( "Menu", CentreX/2 - 30, CentreY/2 - 100, "Calibri", 28 )
	TitleText:setFillColor( 0,0,0)
	sceneGroup:insert(TitleText)	
	
	closeIcon = display.newImage("Images/Icons/close_1-512.png")
	closeIcon:translate( CentreX - 50, 80 )
	closeIcon:scale(0.08,0.08)
	sceneGroup:insert(closeIcon)
 

local buttonEventTable = 
{
handleButtonEvent1,handleButtonEvent2,handleButtonEvent3,handleButtonEvent4,handleButtonEvent5
}
local buttonLabelTable = 
{
"Track","Record","COVID-19 self test","Send feedback","Settings"
}

	local buttonOptions = 
	{
			label = nil,
			onEvent = nil,
			emboss = false,
			-- Properties for a rounded rectangle button
			shape = "roundedRect",
			width = 130,
			height = 40,
			x = CentreX/2,
			y = CentreY/2 - 20,
			cornerRadius = 2,
			fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
			strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4
		}
		

	for A = 1, 5 do
		buttonOptions.y = buttonOptions.y + 50
		buttonOptions.onEvent = buttonEventTable[A]
		buttonOptions.label = buttonLabelTable[A]
		local button1 = widget.newButton(buttonOptions)
		sceneGroup:insert(button1)
	end


	local bottomText = display.newText( "App version XXX\nMade by JiaWei (JWL16038)", CentreX/2, CentreY*1.8,  native.systemFont, 12 )
	bottomText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(bottomText)		


end



 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
 closeIcon:addEventListener( "touch", closeIcon )

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
 		function closeIcon:touch( event )
			if event.phase == "began" then
				hideMenuBar()
			return true
			end
		end

 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 composer.removeScene("SidebarMenu")
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene