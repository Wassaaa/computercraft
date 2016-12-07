p = peripheral.wrap("back")
items = p.getAllStacks()
hammerDir = "South"
MeDir = "Up"

function isHammerable(name)
	if string.find(name, "Broken") ~= nil then
		return true
	elseif string.find(name, "Crushed Uranium") ~= nil then
		return false
	elseif string.find(name, "Crushed") ~= nil then
		return true
	elseif string.find(name, "Powdered") ~= nil then
		return true
	else
		return false
	end
end

function doSorting(_index)
	if items[_index] ~= nil then
		if isHammerable(p.getStackInSlot(_index)["display_name"]) then
			p.pushItem(hammerDir, _index)
		else
			p.pushItem(MeDir, _index)
		end
	end
end

function tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

while true do
	for i=1, 10 do
		--term.clear()
		local counts = 10-i
		print ("Sleeping for: "..counts)
		os.sleep(1)
	end
	print("found "..tableLength(items).." items to move")
	items = p.getAllStacks()	
	table.foreach(items, doSorting)
	print("Moving Items")
end