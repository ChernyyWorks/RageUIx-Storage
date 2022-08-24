---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Florian.
--- DateTime: 22/04/2022 14:58
---

local MainMenu = RageUI.CreateMenu("Title", "SUBTITLE", nil, nil, "rageui", "demo_banner" )
local SubMenu = RageUI.CreateSubMenu(MainMenu, "Title", "SubTitle")

local Checked = false
local GridX, GridY = 0.5, 0.5
local ListIndex = 1

MainMenu.EnableMouse = true

local ListTable = {
	{name = "Object 1", label = "object_1", value = 1},
	{name = "Object 2", label = "object_2", value = 1},
	{name = "Object 3", label = "object_2", value = 1}
}

function RageUI.PoolMenus:Example()
    MainMenu:IsVisible(function(Items)

        Items:Heritage(1, 2)

        Items:AddButton("Render Sprite", "This is a render sprite", { IsDisabled = false }, function(onSelected)

            Items:RenderSprite("rageui", "demo_rendersprite",435, 145, 430, 200, 100)

        end)

        Items:AddSeparator("↓ This is the default Line ↓")

        Items:AddLine()

        Items:AddSeparator("↓ This is the colored Line with RGB ↓")

        Items:AddLine(255, 0, 0)

        Items:AddButton("This is a simple button", "Simple button with RightLabel", { IsDisabled = false, RightLabel = "→" }, function(onSelected)
            if onSelected then
                print("Button selected")
            end
        end)

        Items:AddList("List", { 1, 2, 3 }, ListIndex, 1, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
            if (onListChange) then
                ListIndex = Index
                print(ListIndex)
            end
        end)

        for _, v in pairs(ListTable)
            Items:AddList(v.name, { 1, 2, 3, 4, 5 }, v.value, 1, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
                Items:AddInfo("Info for ListTable", {"Name :", "Label :", "Actual value (ListIndex) :"}, {v.name, v.label, v.value})
                if (onListChange) then
                    v.value = Index
                end
            end)
        end

        Items:AddSeparator("Separator")

        Items:CheckBox("Hello", "Descriptions", Checked, { Style = 1 }, function(onSelected, IsChecked)
            if (onSelected) then
                Checked = IsChecked
                print(Checked)
            end
        end)

        Items:AddButton("Popup", "To create a Popup", { IsDisabled = false }, function(onSelected)
            if onSelected then
                Items:Popup({message = "This is a popup"})
            end
        end)

        Items:AddButton("CharPopup", "To create a Char Popup", { IsDisabled = false }, function(onSelected)
            if onSelected then
                Items:CharPopup({message = "This is a popup", title = "Title", subtitle = "Subtitle", picture = "CHAR_ARTHUR",}) -- you can add other option you just have to look the code
            end
        end)

        Items:AddButton("Grid Pannel", "This is a Panels:Grid", { IsDisabled = false }, function(onSelected)
            if onSelected then
                Items:CharPopup({message = "This is a popup", title = "Title", subtitle = "Subtitle", picture = "CHAR_ARTHUR",}) -- you can add other option you just have to look the code
            end
        end)

        Items:AddButton("Close Menu", "To close the current menu", { IsDisabled = false }, function(onSelected)
            if onSelected then
                Items:CloseCurrentMenu()
            end
        end)

        Items:AddButton("Close All Opened Menu", "To close all of opened menu", { IsDisabled = false }, function(onSelected)
            if onSelected then
                Items:CloseAllMenu()
            end
        end)

        Items:AddButton("Submenu", nil, { IsDisabled = false }, function(onSelected)

        end, submenu)

        Items:AddButton("Show info", nil, { IsDisabled = false }, function(onSelected)
            Items:AddInfo("Info title", {"Info left text 1", "Info left text 2"}, {"Info right text 1", "Info right text 2"})
        end)

    end, function(Panels)
        Panels:Grid(GridX, GridY, "Top", "Bottom", "Left", "Right", function(X, Y, CharacterX, CharacterY)
            GridX = X
            GridY = Y
            print(GridX, GridY)
        end, 12)
    end)

    SubMenu:IsVisible(function(Items)
        -- Items
        Items:AddButton("This is a submenu", "This is a submenu", { IsDisabled = false }, function(onSelected)

        end)
    end, function()
        -- Panels
    end)
end

Keys.Register("E", "E", "Test", function()
    RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
end)
