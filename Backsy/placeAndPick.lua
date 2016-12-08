item = "Botania:livingwood"
while true do
    if not turtle.detect() then
        turtle.place()
    else
        success, block = turtle.inspect()

        if block.name == item then
            turtle.dig()
        end
    end
end 
