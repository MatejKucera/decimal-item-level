local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")

local function UpdateCharacterItemLevel()
    if not CharacterStatsPane or not PaperDollFrame:IsShown() then return end

    local avg, equipped = GetAverageItemLevel()
    local statFrame = CharacterStatsPane.ItemLevelFrame

    if statFrame then
        statFrame.Value:SetText(string.format("%.2f", equipped))
    end
end

frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(1, UpdateCharacterItemLevel)
    else
        UpdateCharacterItemLevel()
    end
end)

hooksecurefunc("PaperDollFrame_UpdateStats", UpdateCharacterItemLevel)