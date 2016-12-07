p = peripheral.wrap("back")
items = p.getAllStacks()
hammerDir = "Up"
--MeDir = "Up"

function isHammerable(name)
	if string.find(name, "Dust") ~= nil then
		return 1
	else
		return 2
	end
end

function doSorting(nr)
	if items[nr] ~= nil then
		if isHammerable(p.getStackInSlot(nr)["display_name"]) == 1 then
			p.pushItem(hammerDir, nr)
		elseif isHammerable(p.getStackInSlot(nr)["display_name"]) == 0 then
			p.pushItem(MeDir, nr)
		else 
			print("keeping "..p.getStackInSlot(nr)["display_name"].." here")
		end
	end
end

function tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

while true do
	p.condenseItems()
	for i=1, 10 do
		--term.clear()
		local counts = 10-i
		print ("Sleeping for: "..counts)
		os.sleep(1)
	end
	print("found "..tableLength(items).." items to move")
	items = p.getAllStacks()	
	--table.foreach(items, doSorting)
	for i=1, tableLength(items) do
		if pcall(doSorting,i) then
			--print("sorting success")
		else
			print("sorting failed")
		end
	end
	--print("Moving Items")
end