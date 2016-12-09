PlaceAndPick = {}

function PlaceAndPick:new(item)
    newObj = {item = item}
    self.__index = self
    return setmetatable(newObj, self)
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
