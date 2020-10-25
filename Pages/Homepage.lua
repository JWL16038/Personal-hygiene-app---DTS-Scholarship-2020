local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local globalvar = require("globalvar")

local ScreenWidth = display.contentWidth
local ScreenHeight = display.contentHeight
local CentreX = display.contentCenterX
local CentreY = display.contentCenterY

local PointsGlobal = require( "HygienePoints" )

titleTextstring = globalvar.titleTextstring
print(titleTextstring)

titleTextstring = "Homepage"
print(titleTextstring)

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
display.setDefault("background",1,1,1)
 


local function gotoQuiz()
    composer.gotoScene("Pages.RecordProgress.menu",{effect="slideLeft"})

end
local function gotoTutorials()
    composer.gotoScene("Pages.tutorials",{effect="slideLeft"})
end

local function gotoselfDiagnosis()
	composer.gotoScene("Pages.WIPpage",{effect="slideLeft"})
end

local function gotoNotifications()
	composer.gotoScene("Pages.WIPpage",{effect="slideLeft"})

end


local function gotoSettings()
	composer.gotoScene("Pages.WIPpage",{effect="slideLeft"})
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
	
	--titleBar:setFillColor(0.11, 0.459,0.741,1)
	--titleBar:setFillColor(0.251, 0.749,0.251,1)
 titleBar:setFillColor(0.561, 0.733,0.6,1)	-- original
	sceneGroup:insert(titleBar)
	
	local titleText = display.newText( "Homepage", CentreX, 10,  native.systemFont, 26 )
	titleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert(titleText)


        local pointsText = display.newText( "",  CentreX, CentreY + 60, 200,ScreenHeight, native.systemFont, 24 )
        pointsText:setFillColor( 0,0,0 )
        pointsText.align = "center"
        sceneGroup:insert(pointsText)
        print("Hygiene points: " .. PointsGlobal.number)
        pointsText.text = "Total hygiene points earned: " .. PointsGlobal.number

        local buttonEventTable =
        {
            gotoQuiz, gotoTutorials, gotoselfDiagnosis, gotoNotifications,gotoSettings
        }
        local buttonLabelTable =
        {
            "Hygiene Quiz","Hygiene Tutorials","COVID self test","Notifications","Settings"
        }



        local buttonOptions =
        {
            label = nil,
            onEvent = nil,
            emboss = false,
            -- Properties for a rounded rectangle button
            shape = "roundedRect",
            width = 150,
            height = 60,
            x = CentreX,
            y = CentreY/3,
            cornerRadius = 2,
            labelColor = { default={ 0, 0, 0 }},
            fillColor = { default={0.5,0.5,0.5,1}, over={1,0.1,0.7,0.4} },
            --fillColor = { default={1,1,0,1}, over={1,0.1,0.7,0.4} },
            strokeWidth = 4,
        }


        for A = 1, #buttonLabelTable do
            buttonOptions.y = buttonOptions.y + 80
            buttonOptions.onEvent = buttonEventTable[A]
            buttonOptions.label = buttonLabelTable[A]
            local button1 = widget.newButton(buttonOptions)
            sceneGroup:insert(button1)
        end


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
        composer.removeScene( "Pages.Homepage", False )
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