args ={...}
sides = {"front", "back", "left", "right", "top", "bottom"}
directions = {"north", "south", "east", "west", "up", "down"}
drops = {"dropup", "dropdown,", "drop"}

function settings()
	if #args==3 then
		for i = 1, 6 do
			if string.lower(args[1]) == sides[i] then
				p=peripheral.wrap(args[1])
				print("peripheral side: "..tostring(args[1]))
				break
			end
		end
		for i = 1, 6 do
			if string.lower(args[2]) == directions[i] then
				turtleDir = args[2]
				print("chest to turtle direction: "..tostring(args[2]))
				break
			end
		end
		for i = 1, 3 do
			if string.lower(args[3]) == drops[i] then
				dropWay(args[3])
				print("dropping way: "..tostring(drop))
				break
			end
		end
		
		
		if p ~= nil and turtleDir ~= nil and drop ~= nil then 
			main()
		else
			print("something went wrong, try again")
			L2U()
		end
	else
		L2U()
	end
end

function dropWay(s)
	if string.find(s, "up") ~= nil then
		drop = turtle.dropUp
		return
	elseif string.find(s, "down") ~= nil then
		drop = turtle.dropDown
		return
	else 
		drop = turtle.drop
		return
	end
end

function L2U()
	print('L2 Use my turtles, \nARGS #1 <peripheral side> \n#2 <Chest to Turtle direction> \n#3 <drop Up/down/nothing>' )
	--print('viable sides: "front", "back", "left", "right", "top", "bottom"')
	--print ('viable directions: "north", "south", "east", "west", "up", "down"')
end
--p = peripheral.wrap("front")
--turtleDir = ("West")

function cleanUp()
	print("sweep sweep sweep WIP")
	for i=1, 16 do
		if turtle.getItemCount(i) > 0 then
			size = p.getInventorySize()
			while p.pullItem(turtleDir, i, 64, size) == 0 do
				size = size - 1
			end
		end
	end
end

function getStacks()
  	for i=1, p.getInventorySize() do
		if p.getStackInSlot(i) ~= nil then
    		quantity = p.getStackInSlot(i).qty
			--if quantity >= 9 then
			if quantity >= 4 then
				doCrafting(i, quantity)
				print("crafting")
			end
		end
	end
end

function doCrafting(slot, n)
	--craftNr = math.floor(n / 9)
	craftNr = math.floor(n / 4)
	p.pushItemIntoSlot(turtleDir,slot,craftNr, 1)
	p.pushItemIntoSlot(turtleDir,slot,craftNr, 2)
	p.pushItemIntoSlot(turtleDir,slot,craftNr, 5)
	p.pushItemIntoSlot(turtleDir,slot,craftNr, 6)
	--p.pushItemIntoSlot(turtleDir,slot,craftNr, 3)
	--p.pushItemIntoSlot(turtleDir,slot,craftNr, 7)
	--p.pushItemIntoSlot(turtleDir,slot,craftNr, 9)
	--p.pushItemIntoSlot(turtleDir,slot,craftNr, 10)
	--p.pushItemIntoSlot(turtleDir,slot,craftNr, 11)
	if turtle.craft() then
		pcall(drop)
	else
		pcall(cleanUp)
		os.sleep(2)
	end
end


function main()
	quantity = 0
	p.condenseItems()
	while true do
		cleanUp()
		getStacks()
		p.condenseItems()
		print("waiting 1")
		os.sleep(0.4)
	end
end

settings()
