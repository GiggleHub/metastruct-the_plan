-- The plan for new mapdata interface --
-- TODO: Add "relative to" to all offsets (maybe change to mapoffset+pos tuples)
-- TODO: Finish all use cases
-- TODO: Implement system
-- TODO: Use the system
-- PROBLEM: data removal, what happens to live maplinkage, discard/handle?

-- POINT OF VIEWS


-- Trigger

	mapdata={
		
		triggers={
			{name="saunatv",min=Vector(3,3,3),max=Vector(3,4,5),mapoffset="sauna"},
			{name="banni",min=Vector(3,3,3),max=Vector(3,4,5),mapoffset="jail"},
			{name="ii",min=Vector(3,3,3),max=Vector(3,4,5),mapoffset=false},
		}

	-- lua trigger creation, map based triggers maybe too
	local function CreateTriggers()
		
		for data in next,m.triggers do
			
			local ent=ents.Create'base_lua_trigger'
			data:MapLink(ent)
			ent:Spawn()
			
		end

	end
	
	-- called each time the data changes and on link
	function TRIGGER:OnMapLink(data)
		self:SetPos(data.min*0.5+data.max*0.5)
		self:SetOBBWorld(data.min,data.max)
	end

	

-- Lua screens

	mapdata={
		
		lscreens={
			{"motd",pos,ang,"lobby1"},
		}

	-- lua trigger creation, map based triggers maybe too
	local function CreateLuaScreens()
		
		for data in next,m.lscreens do
			
			local ent=ents.Create'lua_screen'
			data:MapLink(ent)
			ent:Spawn()
			
		end

	end
	
	-- called each time the data changes and on link
	function SCREEN:OnMapLink(data)
		ent:SetPlace(data[1])
		ent:SetPos(data[2])
		ent:SetAngles(data[3])
	end

-- wanderer spawn
-- wanderer sitting
-- wanderer waypoints

-- mine positions

-- random positions