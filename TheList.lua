local function HandleClick(self)
    name = self.value

    print(name)
end

local function AddContextMenuItem(name)
    local info = UIDropDownMenu_CreateInfo()
    info.owner = which
    info.notCheckable = true
    info.func = HandleClick
    info.text = "Add to Shitlist"
    info.value = name

    UIDropDownMenu_AddButton(info)
end

local function MutateContextMenu()
    hooksecurefunc("UnitPopup_ShowMenu", function(self, event)
        if (UIDROPDOWNMENU_MENU_LEVEL > 1) then return end

        if UnitIsPlayer("target") and not UnitIsUnit("target", "player") then
            local name, realm = UnitName("target")
            name = name .. "-" .. (realm or GetRealmName())
            AddContextMenuItem(name)
        end
    end)
end

local function InitialiseTheList()
    MutateContextMenu()
end

local loadingEvents = CreateFrame("Frame")
loadingEvents:RegisterEvent("PLAYER_ENTERING_WORLD")

loadingEvents:SetScript(
    "OnEvent",
    function(_, event, _)
        if event == "PLAYER_ENTERING_WORLD" then
            InitialiseTheList()
            loadingEvents:UnregisterEvent("PLAYER_ENTERING_WORLD")
        end
    end
)
