function placeAndPick(itemName)
    if not turtle.detect() then
        turtle.place()
    else
        local success, table = turtle.inspect()
        if success and table.name == itemName then
            turtle.dig()
        end
    end
end
