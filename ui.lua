-- Custom styles and icons
data.styles.rc = {outline_size = 1, color = "#EBBE33"}
data.styles.td = {size = 10}
data.styles.speed_vote = {color = "#5AD36E", icon_color = "#67F87F"}
data.colors.ui_green = "#67F87F"
data.brushes.icon_show = "MimiBuff/textures/show.png"
data.brushes.icon_hide = "MimiBuff/textures/hide.png"
data.brushes.icon_minimize = "MimiBuff/textures/minimize.png"
data.brushes.icon_expand = "MimiBuff/textures/expand.png"
data.brushes.icon_arrow_right = "MimiBuff/textures/arrow_right.png"
data.brushes.icon_arrow_left = "MimiBuff/textures/arrow_left.png"
data.brushes.icon_pointer = "MimiBuff/textures/pointer.png"
data.brushes.no_background = "MimiBuff/textures/no_background.png"


-- Options UI
local MimiBuffSettings_Layout<const> = [[
    <VerticalList orientation=vertical child_padding=8 fill=true >
        <MimiBuffTitleBox text_title=mimiiii.option.title iconv=icon_small_durability />
        <HorizontalList>
            <Button fill=true height=32 on_click={mimibuff_click} id=apply text=mimiiii.ui.apply tooltip=mimiiii.ui.applyt />
            <Button width=32 height=32 on_click={mimibuff_click} id=infos icon=icon_question tooltip=mimiiii.ui.helpt margin_left=4 />
            <Button width=32 height=32 on_click={mimibuff_click} id=unhide icon=icon_show tooltip=mimiiii.ui.show_tooltip margin_left=4 />
        </HorizontalList>
        <Box padding=4 blur=true >
            <ScrollList id=list_modules max_height=300 />
        </Box>
        <Box padding=4 blur=true >
            <ScrollList id=list_settings child_padding=4 height=0 />
        </Box>
    </VerticalList>
]]

local MimiBuffSettings_Options = {}
UI.Register("MimiBuffSettings", MimiBuffSettings_Layout, MimiBuffSettings_Options)


function MimiBuffSettings_Options:construct()
    for k, v in pairs(MimiBuffAddonOrder) do
        local widget = self.list_modules:Add([[
            <Box padding=4 bg=popup_additional_bg fill=true margin_bottom=2 >
                <HorizontalList>
                    <Text valign=center text={op_name} fill=true />
                    <Button width=120 height=32 text=mimiiii.ui.setting_button modules={op_param} margin_right=4 />
                    <Button width=32 height=32 icon=icon_hide />
                </HorizontalList>
            </Box>
        ]], {
            tooltip = MimiBuffAddons[v].tooltip,
            op_name = MimiBuffAddons[v].name,
            op_param = MimiBuffAddons[v].id,
            hidden = MimiBuffGetOptionValue(MimiBuffAddons[v].id, "hidden")
        })

        local setting_bt = widget.children[1].children[2]
        setting_bt.on_click = function(button) self:build_settings(MimiBuffAddons[button.modules]) end

        local showhide_bt = widget.children[1].children[3]
        showhide_bt.on_click = function(button)
            widget.hidden = not MimiBuffGetOptionValue(setting_bt.modules, "hidden")
            button.icon = widget.hidden and "icon_show" or "icon_hide"
            Game.OfflinePause(false)
            Action.SendForLocalFaction("SetOptionValue", {addon_id = MimiBuffAddons[v].id, option_id = "hidden", value = widget.hidden})
            self:RefreshUI()
        end
        showhide_bt.icon = MimiBuffGetOptionValue(setting_bt.modules, "hidden") and "icon_show" or "icon_hide"
    end
    self:show_info()
    self:RefreshUI()
end


function MimiBuffSettings_Options:build_settings(list)
    self.list_settings:Clear()
    self.list_settings:Add([[
        <HorizontalList padding=4 >
            <Text valign=center text={op_name} />
        </HorizontalList>
    ]], {op_name = L('mimiiii.ui.module_title', list.name)})

    for k, v in ipairs(list.options) do
        if v.type == "button" then
            local widget = self.list_settings:Add([[
                    <HorizontalList padding=4 >
                        <Button height=32 text={op_text} fill=true />
                    </HorizontalList>
                ]], {

                tooltip = L('mimiiii.ui.buttont', v.tooltip, tostring(v.value)),
                op_text = v.text,
            })
            local button = widget.children[1]
            button.active = MimiBuffGetOptionValue(list.id, v.id)
            button.on_click = function(button)
                button.active = not button.active
                Game.OfflinePause(false)
                Action.SendForLocalFaction("SetOptionValue", {addon_id = list.id, option_id = v.id, value = button.active})
            end

        elseif v.type == "slider" then
            local widget = self.list_settings:Add([[
                    <HorizontalList padding=4 >
                        <Text valign=center width=200 size=12 />
                        <Button icon=icon_minus height=24 valign=center margin_right=2 />
                        <Slider height=32 step=1 on_change={on_update} fill=true />
                        <Button icon=icon_add height=24 valign=center margin_left=2 />
                    </HorizontalList>
                ]], {
                tooltip = L('mimiiii.ui.slidert', v.tooltip, tostring(v.value), tostring(v.min), tostring(v.max))
            })

            local slider = widget.children[3]
            slider.min = v.min
            slider.max = v.max
            slider.step = v.step
            slider.value = MimiBuffGetOptionValue(list.id, v.id)
            widget.children[1].text = L('<td>%s (%s)</>', v.text, slider.value + 0.0)
            slider.on_change = function(slider)
                widget.children[1].text = L('<td>%s (%s)</>', v.text, slider.value + 0.0)
                Game.OfflinePause(false)
                Action.SendForLocalFaction("SetOptionValue", {addon_id = list.id, option_id = v.id, value = slider.value})
            end

            widget.children[2].on_click = function(button)
                slider.value = slider.value > slider.min and slider.value - 1 or slider.value
                widget.children[1].text = L('<td>%s (%s)</>', v.text, slider.value + 0.0)
                Game.OfflinePause(false)
                Action.SendForLocalFaction("SetOptionValue", {addon_id = list.id, option_id = v.id, value = slider.value})
            end

            widget.children[4].on_click = function(button)
                slider.value = slider.value < slider.max and slider.value + 1 or slider.value
                widget.children[1].text = L('<td>%s (%s)</>', v.text, slider.value + 0.0)
                Game.OfflinePause(false)
                Action.SendForLocalFaction("SetOptionValue", {addon_id = list.id, option_id = v.id, value = slider.value})
            end

        elseif v.type == "combo" then
            local widget = self.list_settings:Add([[
                    <HorizontalList padding=4 >
                        <Text valign=center width=200 />
                        <Combo height=32 step=1 on_change={on_update} fill=true />
                    </HorizontalList>
                ]], {
                tooltip = L('mimiiii.ui.combot', v.tooltip, v.texts[v.value])
            })
            local combo = widget.children[2]
            combo.texts = v.texts
            combo.value = MimiBuffGetOptionValue(list.id, v.id)
            widget.children[1].text = L('<td>%s</>', v.text)
            combo.on_change = function(combo)
                Game.OfflinePause(false)
                Action.SendForLocalFaction("SetOptionValue", {addon_id = list.id, option_id = v.id, value = combo.value})
            end
        elseif v.type == "separator" then
            self.list_settings:Add([[
                <Image height=2 color=ui_dark />
            ]])
        end
    end
end


function MimiBuffSettings_Options:mimibuff_click(button)
    if button.id == "apply" then
        Game.SaveGame("MimiBuff_TEMP", "MimiBuff_TEMP")
        Game.LoadGame("MimiBuff_TEMP")
    end

    if button.id == "infos" then
        self:show_info()
    end

    if button.id == "unhide" then
        for k, v in pairs(self.list_modules.children) do
            if button.icon == "icon_show" then
                v.hidden = false
            elseif button.icon == "icon_hide" then
                if self.list_modules.children[k].children[1].children[3].icon == "icon_show" then
                    v.hidden = true
                end
            end
        end
        if button.icon == "icon_show" then
            button.icon = "icon_hide"
            button.tooltip = "mimiiii.ui.hide_tooltip"
        elseif button.icon == "icon_hide" then
            button.icon = "icon_show"
            button.tooltip = "mimiiii.ui.show_tooltip"
        end
        self:RefreshUI()
    end
end


function MimiBuffSettings_Options:show_info()
    self.list_settings:Clear()
    self.list_settings:Add([[
        <Text text=mimiiii.ui.help wrap=true />
    ]])
end


function MimiBuffSettings_Options:RefreshUI()
    local width, height = self.list_modules:GetDesiredSize()
    self.list_settings.height = 654 - height
end