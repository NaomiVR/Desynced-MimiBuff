function GetModInfos(id)
    for k, v in pairs(Game.GetInstalledMods()) do
        if v.id == id then
            return v
        end
    end
end

data.styles.rv = {size = 10, outline_size = 1, color = "#FFC0CB"}


local MimiBuffTitleBox = {}
UI.Register("MimiBuffTitleBox", [[
    <HorizontalList>
        <Box padding=4 bg=card_box_bg margin_right=4 ><Image image={iconv} width=26 height=26 /></Box>
        <Box padding=4 bg=card_box_bg fill=true ><Text text={text_title} valign=center margin_left=4 /></Box>
    </HorizontalList>
]], MimiBuffTitleBox)


local MimiBuffTitleBoxTexted = {}
UI.Register("MimiBuffTitleBoxTexted", [[
    <VerticalList margin_bottom=4 >
        <HorizontalList>
            <Box padding=4 bg=card_box_bg margin_bottom=4 margin_right=4 ><Image image={iconv} width=26 height=26 /></Box>
            <Box padding=4 bg=card_box_bg margin_bottom=4 fill=true ><Text text={text_title} valign=center margin_left=4 /></Box>
        </HorizontalList>
        <Text text={text_content} wrap=true />
    </VerticalList>
]], MimiBuffTitleBoxTexted)


local MimiBuffDefault_Options = {}
local MimiBuffDefault_Layout<const> = [[
    <VerticalList child_padding=8 fill=true >
        <MimiBuffTitleBoxTexted text_title=mimiiii.option.title text_content=mimiiii.option.titlet iconv=icon_small_day />
        <MimiBuffTitleBoxTexted text_title=mimiiii.option.languages text_content=mimiiii.option.languagest iconv=icon_small_behavior />
        <MimiBuffTitleBoxTexted text_title=mimiiii.option.content text_content=mimiiii.option.contentt iconv=icon_small_sort />
        <MimiBuffTitleBoxTexted text_title=mimiiii.option.warn text_content=mimiiii.option.warnt iconv=icon_small_warning />
        <Text id=mimibuff_version dock = bottom-right size=8 color="bbcece" />
    </VerticalList>
]]


if not UI.IsRegistered("MimiBuffDefault") then
    UI.Register("MimiBuffDefault", MimiBuffDefault_Layout, MimiBuffDefault_Options)
end

function MimiBuffDefault_Options:construct()
    self.mimibuff_version.text = "V" .. GetModInfos("MimiBuff").version_name
end


if Map.IsFrontEnd() or not UI.IsRegistered("MimiBuffSettings") or not Game.IsHostPlayer() then
    return UI.New("MimiBuffDefault")
end

return UI.New("MimiBuffSettings")