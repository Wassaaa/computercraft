PlaceAndPick = {}

function PlaceAndPick:new()
    print("Set item with :SetItem(item)")
    newObj = {}
    self.__index = self
    return setmetatable(newObj, self)
end

function PlaceAndPick:SetItem(item)
    print("Item is " .. item)
    self.item = item
end

function PlaceAndPick:DoOnce()
    print('I say ')
    if not turtle.detect() then
        turtle.place()
    else
        local success, table = turtle.inspect()
        if success and table.name == self.item then
            turtle.dig()
        end
    end
end
