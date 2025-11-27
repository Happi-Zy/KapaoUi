--[[
    ═══════════════════════════════════════════════════════════
    KAPAO UI - COMPLETE COMPONENT TEST
    ทดสอบทั้ง 14 Components ครบถ้วน
    ═══════════════════════════════════════════════════════════
]]

print("🔄 Loading KapaoUI...")
local KapaoUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Happi-Zy/KapaoUi/refs/heads/main/KapaoUi"))()

print("✅ Creating Window...")
local Window = KapaoUI:CreateWindow({
    Title = "Kapao Hub - Full Test",
    Subtitle = "All 14 Components",
    ScriptName = "FullComponentTest",
    Version = "v2.1.0",
})

Window:Notify({
    Title = "🎉 Loading Complete",
    Description = "Testing all 14 UI components",
    Duration = 3,
    Type = "Success",
})

-- ═══════════════════════════════════════════════════════════
-- TAB 1: Basic Components (1-5)
-- ═══════════════════════════════════════════════════════════

local Tab1 = Window:AddTab("📦 Basic")

-- Component 1: Section
Tab1:AddSection("Component 1: Section Headers")
print("✅ Component 1: Section")

-- Component 2: Divider
Tab1:AddDivider()
print("✅ Component 2: Divider")

-- Component 3: Label
Tab1:AddLabel("Component 3: Simple text label")
Tab1:AddLabel("Labels can display any text information")
print("✅ Component 3: Label")

Tab1:AddDivider()

-- Component 4: Paragraph
Tab1:AddParagraph({
    Title = "Component 4: Paragraph",
    Content = "This is a paragraph component. It supports longer text with a title and multi-line content for detailed information.",
})
print("✅ Component 4: Paragraph")

Tab1:AddDivider()

-- Component 5: Button
Tab1:AddButton({
    Label = "Component 5: Click This Button",
    Callback = function()
        Window:Notify({
            Title = "Button Clicked!",
            Description = "Component 5 works perfectly",
            Type = "Success",
        })
        print("✅ Component 5: Button clicked!")
    end,
})

Tab1:AddButton({
    Label = "Test Error Notification",
    Callback = function()
        Window:Notify({
            Title = "Error Test",
            Description = "This is an error notification",
            Type = "Error",
        })
    end,
})

-- ═══════════════════════════════════════════════════════════
-- TAB 2: Interactive Components (6-9)
-- ═══════════════════════════════════════════════════════════

local Tab2 = Window:AddTab("🎮 Interactive")

Tab2:AddSection("Component 6: Toggle")

-- Component 6: Toggle
local TestToggle = Tab2:AddToggle({
    Label = "Enable Feature",
    Key = "test_toggle",
    Default = false,
    Callback = function(Value)
        print("✅ Component 6: Toggle =", Value)
        Window:Notify({
            Title = "Toggle Changed",
            Description = "State: " .. tostring(Value),
            Type = "Info",
        })
    end,
})

Tab2:AddToggle({
    Label = "Auto Save Config",
    Key = "auto_save",
    Default = true,
    Callback = function(Value)
        print("Auto Save:", Value)
    end,
})

Tab2:AddDivider()
Tab2:AddSection("Component 7: Slider")

-- Component 7: Slider
local TestSlider = Tab2:AddSlider({
    Label = "Volume Control",
    Key = "test_slider",
    Min = 0,
    Max = 100,
    Increment = 5,
    Default = 50,
    Callback = function(Value)
        print("✅ Component 7: Slider =", Value)
    end,
})

Tab2:AddSlider({
    Label = "Speed Multiplier",
    Key = "speed_mult",
    Min = 1,
    Max = 10,
    Increment = 0.5,
    Default = 1,
    Callback = function(Value)
        print("Speed:", Value)
    end,
})

Tab2:AddDivider()
Tab2:AddSection("Component 8: Dropdown")

-- Component 8: Dropdown
local TestDropdown = Tab2:AddDropdown({
    Label = "Select Mode",
    Key = "test_dropdown",
    Options = {"Mode A", "Mode B", "Mode C", "Mode D"},
    Default = "Mode A",
    Callback = function(Value)
        print("✅ Component 8: Dropdown =", Value)
        Window:Notify({
            Title = "Dropdown Changed",
            Description = "Selected: " .. Value,
            Type = "Info",
        })
    end,
})

Tab2:AddDivider()
Tab2:AddSection("Component 9: Multi-Dropdown")

-- Component 9: MultiDropdown
local TestMultiDrop = Tab2:AddMultiDropdown({
    Label = "Select Multiple Items",
    Key = "test_multi",
    Options = {"Apple", "Banana", "Cherry", "Durian", "Elderberry"},
    Default = {"Apple"},
    Callback = function(Selected)
        print("✅ Component 9: MultiDropdown =", table.concat(Selected, ", "))
    end,
})

-- ═══════════════════════════════════════════════════════════
-- TAB 3: Input & Display (10-12)
-- ═══════════════════════════════════════════════════════════

local Tab3 = Window:AddTab("⌨️ Input")

Tab3:AddSection("Component 10: TextBox")

-- Component 10: TextBox
local TestTextBox = Tab3:AddTextBox({
    Label = "Username",
    Key = "test_textbox",
    Default = "Player123",
    Placeholder = "Enter your name...",
    Callback = function(Text)
        print("✅ Component 10: TextBox =", Text)
        Window:Notify({
            Title = "Text Updated",
            Description = "New text: " .. Text,
            Type = "Info",
        })
    end,
})

Tab3:AddTextBox({
    Label = "Discord Webhook",
    Key = "webhook_url",
    Default = "",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(Text)
        print("Webhook:", Text)
    end,
})

Tab3:AddDivider()
Tab3:AddSection("Component 11: Status Label")

-- Component 11: StatusLabel
local TestStatus = Tab3:AddStatusLabel({
    Label = "Current Status",
    Value = "Ready",
})

Tab3:AddButton({
    Label = "Update Status to Running",
    Callback = function()
        TestStatus:SetValue("Running... " .. os.date("%H:%M:%S"))
        print("✅ Component 11: StatusLabel updated!")
    end,
})

Tab3:AddButton({
    Label = "Update Status to Stopped",
    Callback = function()
        TestStatus:SetValue("Stopped")
    end,
})

Tab3:AddDivider()
Tab3:AddSection("Component 12: Progress Bar")

-- Component 12: ProgressBar
local TestProgress = Tab3:AddProgressBar({
    Label = "Download Progress",
    Key = "test_progress",
    Max = 100,
    Value = 0,
})

Tab3:AddButton({
    Label = "Increase Progress +10",
    Callback = function()
        local Current = TestProgress:Get()
        TestProgress:Set(math.min(Current + 10, 100))
        print("✅ Component 12: ProgressBar =", TestProgress:Get())
    end,
})

Tab3:AddButton({
    Label = "Decrease Progress -10",
    Callback = function()
        local Current = TestProgress:Get()
        TestProgress:Set(math.max(Current - 10, 0))
    end,
})

Tab3:AddButton({
    Label = "Reset Progress",
    Callback = function()
        TestProgress:Set(0)
    end,
})

-- ═══════════════════════════════════════════════════════════
-- TAB 4: Keybinds (Component 13)
-- ═══════════════════════════════════════════════════════════

local Tab4 = Window:AddTab("⌨️ Keybinds")

Tab4:AddSection("Component 13: Keybind")

Tab4:AddLabel("Click on a key button below to rebind")

-- Component 13: Keybind
Tab4:AddKeybind({
    Label = "Toggle UI Visibility",
    Key = "toggle_ui_key",
    Default = "V",
    Callback = function()
        print("✅ Component 13: Keybind pressed!")
        Window:Notify({
            Title = "Keybind Activated",
            Description = "You pressed the assigned key",
            Type = "Success",
        })
    end,
})

Tab4:AddKeybind({
    Label = "Toggle Feature",
    Key = "toggle_feature_key",
    Default = "F",
    Callback = function()
        local CurrentState = TestToggle:Get()
        TestToggle:Set(not CurrentState)
        print("Feature toggled via keybind:", not CurrentState)
    end,
})

Tab4:AddKeybind({
    Label = "Increase Slider",
    Key = "increase_slider_key",
    Default = "UP",
    Callback = function()
        local Current = TestSlider:Get()
        TestSlider:Set(math.min(Current + 10, 100))
    end,
})

Tab4:AddKeybind({
    Label = "Decrease Slider",
    Key = "decrease_slider_key",
    Default = "DOWN",
    Callback = function()
        local Current = TestSlider:Get()
        TestSlider:Set(math.max(Current - 10, 0))
    end,
})

-- ═══════════════════════════════════════════════════════════
-- TAB 5: Notifications (Component 14)
-- ═══════════════════════════════════════════════════════════

local Tab5 = Window:AddTab("🔔 Notifications")

Tab5:AddSection("Component 14: Notification System")

Tab5:AddLabel("Test different notification types:")

Tab5:AddButton({
    Label = "Info Notification",
    Callback = function()
        Window:Notify({
            Title = "ℹ️ Information",
            Description = "This is an info notification",
            Type = "Info",
            Duration = 3,
        })
        print("✅ Component 14: Info Notification")
    end,
})

Tab5:AddButton({
    Label = "Success Notification",
    Callback = function()
        Window:Notify({
            Title = "✅ Success",
            Description = "Operation completed successfully",
            Type = "Success",
            Duration = 3,
        })
        print("✅ Component 14: Success Notification")
    end,
})

Tab5:AddButton({
    Label = "Warning Notification",
    Callback = function()
        Window:Notify({
            Title = "⚠️ Warning",
            Description = "Please check your settings",
            Type = "Warning",
            Duration = 3,
        })
        print("✅ Component 14: Warning Notification")
    end,
})

Tab5:AddButton({
    Label = "Error Notification",
    Callback = function()
        Window:Notify({
            Title = "❌ Error",
            Description = "Something went wrong!",
            Type = "Error",
            Duration = 3,
        })
        print("✅ Component 14: Error Notification")
    end,
})

Tab5:AddDivider()

Tab5:AddButton({
    Label = "🎆 Test All Notifications (Sequence)",
    Callback = function()
        Window:Notify({Title = "1/4 Info", Description = "Testing info notification...", Type = "Info", Duration = 2})
        task.wait(2.5)
        Window:Notify({Title = "2/4 Success", Description = "Testing success notification...", Type = "Success", Duration = 2})
        task.wait(2.5)
        Window:Notify({Title = "3/4 Warning", Description = "Testing warning notification...", Type = "Warning", Duration = 2})
        task.wait(2.5)
        Window:Notify({Title = "4/4 Error", Description = "Testing error notification...", Type = "Error", Duration = 2})
    end,
})

-- ═══════════════════════════════════════════════════════════
-- TAB 6: Programmatic Control
-- ═══════════════════════════════════════════════════════════

local Tab6 = Window:AddTab("🎛️ Control")

Tab6:AddSection("Programmatic Component Control")

Tab6:AddLabel("Use buttons to control other components:")

Tab6:AddButton({
    Label = "Set Toggle ON",
    Callback = function()
        TestToggle:Set(true)
    end,
})

Tab6:AddButton({
    Label = "Set Toggle OFF",
    Callback = function()
        TestToggle:Set(false)
    end,
})

Tab6:AddButton({
    Label = "Set Slider to 75",
    Callback = function()
        TestSlider:Set(75)
    end,
})

Tab6:AddButton({
    Label = "Change Dropdown to Mode C",
    Callback = function()
        TestDropdown:Set("Mode C")
    end,
})

Tab6:AddButton({
    Label = "Update TextBox",
    Callback = function()
        TestTextBox:SetText("Updated_" .. os.date("%H%M%S"))
    end,
})

Tab6:AddButton({
    Label = "Set Progress to 50%",
    Callback = function()
        TestProgress:Set(50)
    end,
})

Tab6:AddDivider()

Tab6:AddButton({
    Label = "🎯 Get All Values",
    Callback = function()
        print("═══════════════════════════════")
        print("Current Component Values:")
        print("Toggle:", TestToggle:Get())
        print("Slider:", TestSlider:Get())
        print("Dropdown:", TestDropdown:Get())
        print("TextBox:", TestTextBox:GetText())
        print("Progress:", TestProgress:Get())
        print("Status:", TestStatus:GetValue())
        print("═══════════════════════════════")
        
        Window:Notify({
            Title = "Values Retrieved",
            Description = "Check console for all values",
            Type = "Info",
        })
    end,
})

-- ═══════════════════════════════════════════════════════════
-- Final Summary
-- ═══════════════════════════════════════════════════════════

print("═════════════════════════════════════════════════")
print("✅ ALL 14 COMPONENTS LOADED!")
print("═════════════════════════════════════════════════")
print("📋 Component List:")
print("  1. ✅ Section Headers")
print("  2. ✅ Dividers")
print("  3. ✅ Labels")
print("  4. ✅ Paragraphs")
print("  5. ✅ Buttons")
print("  6. ✅ Toggles")
print("  7. ✅ Sliders")
print("  8. ✅ Dropdowns")
print("  9. ✅ Multi-Dropdowns")
print(" 10. ✅ TextBoxes")
print(" 11. ✅ Status Labels")
print(" 12. ✅ Progress Bars")
print(" 13. ✅ Keybinds")
print(" 14. ✅ Notifications")
print("═════════════════════════════════════════════════")
print("💾 Auto-save: Enabled")
print("🎨 Theme: Manhwa Sci-Fi (Cyan)")
print("🔄 Rounded corners: Updated")
print("═════════════════════════════════════════════════")

Window:Notify({
    Title = "🎉 Test Complete!",
    Description = "All 14 components ready to test!",
    Type = "Success",
    Duration = 5,
})
