local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
 

local ScreenWidth = display.contentWidth
local ScreenHeight = display.contentHeight
local CentreX = display.contentCenterX
local CentreY = display.contentCenterY 

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
display.setDefault("background",1,1,1)
 

local function takeAnswer(event)
	if event.phase == "ended" then
			composer.gotoScene("Pages.RecordProgress.menu",{effect="slideRight"})
		
	end
end

 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
	local titleBar = display.newRect( CentreX, 10, ScreenWidth, 70 )
	titleBar:setFillColor(0.561, 0.733,0.6,1)	sceneGroup:insert(titleBar)

		local titleText = display.newText( "Coughing Etiquette quiz", CentreX, 10,  native.systemFont, 22 )
	titleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(titleText)
	
	local questionText = display.newText("Please keep practicing your coughing etiquette!", CentreX, CentreY, ScreenWidth - 25, 0,native.systemFont, 26 )
	questionText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(questionText)
		
			
	local yesButton = widget.newButton(
		{
			label = "Return",
			onEvent = takeAnswer,
			shape = "roundedRect",
			width = 120,
			height = 40,
			cornerRadius = 2,
			labelColor = { default={ 0, 0, 0 }},
			fillColor = { default={0,1,0,1}, over={1,0.1,0.7,0.4} },
			strokeWidth = 4,
			x = CentreX,
			y = CentreY*2,
		}
	)
	sceneGroup:insert(yesButton)

	
	 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
	
	
 
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