local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local sqlite3 = require("sqlite3")

local ScreenWidth = display.contentWidth
local ScreenHeight = display.contentHeight
local CentreX = display.contentCenterX
local CentreY = display.contentCenterY 

local instructionNo = 1
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

display.setDefault("background",1,1,1)
local prevScene = composer.getSceneName( "previous" )

local textpath = system.pathForFile("SQLiteDB.db", system.ResourceDirectory)
local db = sqlite3.open(textpath)

sqlcommand = ("SELECT * FROM CoughingEtiquette")
local titleTable = {}
local instructionTable = {}
local idTable = {}
local Images = {}
local Videos = {}

for i in db:nrows(sqlcommand) do
	SortID = i.SortID
	Title = i.Title
	Instruction = i.Instruction
	ImageName = i.ImageName
	VideoName = i.VideoName
	table.insert(idTable,SortID)
	table.insert(titleTable,SortID,Title)
	table.insert(instructionTable,SortID,Instruction)
	table.insert(Images,SortID,ImageName)
	table.insert(Videos,SortID,VideoName)
end

local function updateText(event)
	if instructionTable[instructionNo] ~= nil then
		print("instructionNo: " .. instructionNo)
		print(titleTable[instructionNo])
		titleText.text = titleTable[instructionNo]
		questionText.text = instructionTable[instructionNo]

		instlength = instructionTable[instructionNo]
		if string.len(instlength) > 90 then
			print("text too long")
			questionText.size = 20
		else
			print("text OK")
			questionText.size = 24
		end
	else
		questionText.text = nil
	end
end

local function updateImage(event)
	if Images[instructionNo] ~= nil then
		display.remove(image)
		local maxWidth = ScreenWidth *0.8
		local maxHeight = 300
		image = display.newImage("Images/RecordProgress/CoughingEtiquette/" .. Images[instructionNo]  )

		if image.width > image.height then --wide image
			image.xScale = maxWidth / image.width
			image.yScale = image.xScale
		else -- tall image
			image.yScale = maxHeight / image.height
			image.xScale = image.yScale
		end
		image:translate( CentreX, CentreY*1.4 )
	else
		display.remove(image)
	end
end

local function updateVideo(event)
	if Videos[instructionNo] ~= nil then
		display.remove(video)
		local maxWidth = ScreenWidth *0.8
		local maxHeight = 150
		video = native.newVideo( CentreX, CentreY*1.2, 320, 480 )
		video:load("Images/RecordProgress/CoughingEtiquette/" .. Videos[instructionNo]  )

		if video.width > video.height then --wide image
			video.xScale = maxWidth / video.width
			video.yScale = video.xScale
		else -- tall image
			video.yScale = maxHeight / video.height
			video.xScale = video.yScale
		end
		video:play()
		video:translate( CentreX, CentreY*1.4 )
	else
		display.remove(video)
	end
end


local function gotoNext(event)
	if event.phase == "ended" then

		if instructionNo < table.maxn(idTable) then
			instructionNo = instructionNo + 1
			updateImage()
			updateText()
			updateVideo()
		else
			display.remove(image)
			display.remove(video)
			display.remove(questionText)
			composer.gotoScene("Pages.RecordProgress.CoughingEtiquette.tutFinished",{effect="slideLeft"})
			instructionNo = 1
		end
	end
end

local function gotoBack(event)
	if event.phase == "ended" then
		if instructionNo ~= 1 then
			instructionNo = instructionNo - 1
			updateText()
			updateImage()
			updateVideo()
		else
			print("end of instructions")
			display.remove(image)
			display.remove(video)
			display.remove(questionText)
			composer.gotoScene(prevScene,{effect="slideRight"})
			instructionNo = 1
		end
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

			titleText = display.newText( Title, CentreX, 10,  native.systemFont, 20 )
			titleText:setFillColor( 0, 0, 0 )
			sceneGroup:insert(titleText)

			questionText = display.newText( instructionTable[1], CentreX, CentreY/2, ScreenWidth - 25, 0,native.systemFont, 24 )
			questionText:setFillColor( 0, 0, 0 )


			updateImage()
			updateVideo()

			local nextButton = widget.newButton(
					{
						label = "Next",
						onEvent = gotoNext,
						shape = "roundedRect",
						width = 60,
						height = 40,
						cornerRadius = 2,
						labelColor = { default={ 0, 0, 0 }},
						fillColor = { default={0.259, 0.961, 0.518,1}, over={1,0.1,0.7,0.4} },
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
						labelColor = { default={ 0, 0, 0 }},
						fillColor = { default={0.259, 0.961, 0.518,1}, over={1,0.1,0.7,0.4} },
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