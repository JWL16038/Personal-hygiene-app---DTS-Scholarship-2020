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
 
local prevScene = composer.getSceneName( "previous" )


local function gotoNext(event)
	if event.phase == "ended" then
		composer.gotoScene("Pages.RecordProgress.Facemask.tut6",{effect="slideLeft"})
	end
end

local function gotoBack(event)
	if event.phase == "ended" then
		composer.gotoScene(prevScene,{effect="slideRight"})
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
	titleBar:setFillColor( 0,0.62,0.451,1 )
	sceneGroup:insert(titleBar)
	
	local titleText = display.newText( "Face mask instructions", CentreX, 10,  native.systemFont, 26 )
	titleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(titleText)
	
	local questionText = display.newText( "Follow the instructions below for the type of mask you are using.\nFace Mask with Ear loops: Hold the mask by the ear loops. Place a loop around each ear.\nFace Mask with Ties: Bring the mask to your nose level and place the ties over the crown of your head and secure with a bow.\nFace Mask with Bands: Hold the mask in your hand with the nosepiece or top of the mask at fingertips, allowing the headbands to hang freely below hands. Bring the mask to your nose level and pull the top strap over your head so that it rests over the crown of your head. Pull the bottom strap over your head so that it rests at the nape of your neck.", CentreX, CentreY, ScreenWidth - 25, 0,native.systemFont, 16 )
	questionText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(questionText)
		
			
	local nextButton = widget.newButton(
		{
			label = "Next",
			onEvent = gotoNext,
			shape = "roundedRect",
			width = 60,
			height = 40,
			cornerRadius = 2,
			fillColor = { default={0,1,0,1}, over={1,0.1,0.7,0.4} },
			strokeWidth = 4,
			x = CentreX*1.5,
			y = CentreY*2,
		}
	)
	sceneGroup:insert(nextButton)
	
	local prevButton = widget.newButton(
		{
			label = "Back",
			onEvent = gotoBack,
			shape = "roundedRect",
			width = 60,
			height = 40,
			cornerRadius = 2,
			fillColor = { default={0,1,0,1}, over={1,0.1,0.7,0.4} },
			strokeWidth = 4,
			x = CentreX/2,
			y = CentreY*2,
		}
	)
	sceneGroup:insert(prevButton)
	
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