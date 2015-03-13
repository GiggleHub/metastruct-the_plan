local META1={}
local META2={}
function META:update()
	
end
function META1:add(tt)
	local t=self[1]
	t[#t+1]=tt
end
function META:iter()
	
end

local m=ms.mapdata
m={
	
	triggers={
		{name="bb",min=Vector(3,3,3),max=Vector(3,4,5)},
		{name="banni",min=Vector(3,3,3),max=Vector(3,4,5)},
		{name="ii",min=Vector(3,3,3),max=Vector(3,4,5)},
	},
	hospitalpos=ector(0,0,0),
	wanderer_sitpos={
	{Vector(),Angle()}
	}
}


m.triggers:add{name='bani',min=Vector(3,3,3),max=Vector(4,4,4)}

function ENT:OnMapData(data)
	self:SetPos(data.min*0.5+data.max*0.5)
	self:SetOBBWorld(data.min,data.max)
end

local function CreateTriggers()
	
	for data in m.triggers:iter() do
		
		local ent=ents.Create'base_lua_trigger'
		data:link(ent)
		
	end

end


for data in m.triggers:iter() do
	
	if data.name=="bani" then
		data.min=Vector(0,0,0)
		data.max=Vector(1,1,1)
		data:update()
	end
	
end
