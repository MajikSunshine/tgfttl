targetless.var = {}
targetless.var.timer = Timer()
targetless.var.version = "1.7.19"
targetless.var.tgfttlversion = "1.3.3.2"
targetless.var.modeconvert = {"none", "PvP", "Cap", "Bomb", "All", "Ore", "Guard", "StTurret"}
targetless.var.modeoption = {"ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON"}
targetless.var.state = false
targetless.var.updatelock = false
targetless.var.roidtype = 1
targetless.var.targetnum = 0
targetless.var.lasttarget = nil
targetless.var.lasttype = nil
targetless.var.listpage = "target"
targetless.var.faction = gkini.ReadString("targetless", "factiontype", "bar")
targetless.var.noteoffset = 741937
targetless.var.fontscale = gkini.ReadInt("targetless", "fontscale", 50)/100
targetless.var.basefontsize = gkini.ReadInt("targetless", "basefontsize", 0)
targetless.var.res = gkinterface.GetXResolution()

-- calculate the trim size for this device/setting/etc, this is used to trim targetless
-- ship/name values to fit at the given font/resolution setting
function targetless.var.trimcalc()
targetless.var.trim = math.ceil((targetless.var.res/4 - 88)/4)/(targetless.var.fontscale+1)
targetless.var.trimore = math.ceil((gkinterface.GetXResolution()/4-30)/55)
end
targetless.var.trimcalc()

-- calculate the font size for this device/setting/etc
function targetless.var.fontcalc()
    -- if set in config use that, otherwise default to 11/20 for pc/mobile respectively
    if targetless.var.basefontsize > 0 then
        targetless.var.font = targetless.var.basefontsize*(gkinterface.GetXResolution()/1000)*targetless.var.fontscale
    elseif gkinterface.IsTouchModeEnabled() then
        -- mobile devices have weird/reduced fonts, upscale them here
        targetless.var.font = 20*(gkinterface.GetXResolution()/1000)*targetless.var.fontscale
    else
        targetless.var.font = 11*(gkinterface.GetXResolution()/1000)*targetless.var.fontscale
    end
end
targetless.var.fontcalc()

-- config settings
targetless.var.refreshDelay = tonumber(gkini.ReadString("targetless", "refresh", "1000"))
targetless.var.place = gkini.ReadString("targetless", "place", "right")
targetless.var.sortBy = gkini.ReadString("targetless", "sort", "distance")
targetless.var.oresort = gkini.ReadString("targetless", "oresort", "Heliocene")
targetless.var.showRoid = gkini.ReadString("targetless", "roidtab", "ON")
targetless.var.showtls = gkini.ReadString("targetless", "showtls", "ON")
targetless.var.showself = gkini.ReadString("targetless", "showself", "ON")
targetless.var.showselfcenter = gkini.ReadString("targetless", "showselfcenter", "OFF")
targetless.var.showtargetcenter = gkini.ReadString("targetless", "showtargetcenter", "ON")
targetless.var.listmax = tonumber(gkini.ReadString("targetless", "listmax", "10"))
targetless.var.roidmax = tonumber(gkini.ReadString("targetless", "roidmax", "10"))
targetless.var.roidrefresh = tonumber(gkini.ReadString("targetless", "roidrefresh", "3000"))
targetless.var.selfframe = gkini.ReadString("targetless", "selfframe", "OFF")
targetless.var.selfcapframe = gkini.ReadString("targetless", "selfcapframe", "OFF")
targetless.var.pinframe = gkini.ReadString("targetless", "pinframe", "ON")
targetless.var.listframe = gkini.ReadString("targetless", "listframe", "OFF")
targetless.var.showore = gkini.ReadString("targetless", "showore", "ON")
targetless.var.scanall = gkini.ReadString("targetless", "scanall", "ON")
targetless.var.autopin = {}
targetless.var.autopin.damage = gkini.ReadString("targetless", "pindamage", "ON")

targetless.var.huddisplay = {}
targetless.var.huddisplay.showpvp = gkini.ReadString("targetless", "showpvp", "ON")
targetless.var.modeoption[2] = targetless.var.huddisplay.showpvp
targetless.var.huddisplay.showpve = gkini.ReadString("targetless", "showpve", "ON")
targetless.var.huddisplay.showcaps = gkini.ReadString("targetless", "showcaps", "ON")
targetless.var.modeoption[3] = targetless.var.huddisplay.showcaps
targetless.var.huddisplay.showbomb = gkini.ReadString("targetless", "showbomb", "ON")
targetless.var.modeoption[4] = targetless.var.huddisplay.showbomb
targetless.var.huddisplay.showships = gkini.ReadString("targetless", "showships", "ON")
targetless.var.modeoption[5] = targetless.var.huddisplay.showships --"All"
if targetless.var.huddisplay.showpve == "OFF" then
  for x = 3, 7 do
    targetless.var.modeoption[x] = "OFF"
  end
end
targetless.var.huddisplay.showore = gkini.ReadString("targetless", "showore", "ON")
targetless.var.modeoption[8] = targetless.var.huddisplay.showore
targetless.var.huddisplay.showguard = gkini.ReadString("targetless", "showguard", "ON")
targetless.var.modeoption[6] = targetless.var.huddisplay.showguard 
targetless.var.huddisplay.showturret = gkini.ReadString("targetless", "showturret", "ON")
targetless.var.modeoption[7] = targetless.var.huddisplay.showturret 
targetless.var.mycaps = {}
targetless.var.joystickmodeport = gkini.ReadString("targetless", "joyportmode", "0")
targetless.var.joysticktarport = gkini.ReadString("targetless", "joyporttarget", "0")
targetless.var.joystickmodaxis = gkini.ReadString("targetless", "joymodaxislist", "5")
targetless.var.joysticktaraxis = gkini.ReadString("targetless", "joytaraxislist", "6")
if targetless.var.joystickmodeport ~= '0' then
  gkinterface.BindJoystickCommand(targetless.var.joystickmodeport-1,targetless.var.joystickmodaxis,'joyswitch')
end
if targetless.var.joysticktarport ~= '0' then
  gkinterface.BindJoystickCommand(targetless.var.joysticktarport-1,targetless.var.joysticktaraxis,'joyLS')
end

-- layout format strings
targetless.var.layout = {}

targetless.var.layout.self = {
    {
        {"<tab>","<health>"},
    },

    {
        {"<fill>","<lstand>"},
    },
    {
        {"<tab>","<healthtext>","<name>","<fill>"},
    },
}

targetless.var.layout.selfcenter = {
    {
        {"<healthtext>","<fill>","<lstand>"},
	{"<autox>","<fill>","<dsort>"},
    },
}

targetless.var.layout.center = {
    {
        {"<distance>","<fill>"},
        {"<healthtext>","<fill>"},
        {"<tab>","<fill>"},
        {"<health>"},
    },
    {
        {"<fill>","<istand>","<sstand>","<ustand>","<lstand>"},
        {"<tab>","<fill>"},
        {"<fill>","<pcship>"},
        {"<name>","<fill>"},
    },
}

-- this is the new format to be used by all ships
-- ships can hide these values as needed, but layout if present is locked
-- to what this container defines :(
--
-- TODO implement list cells, in progress
targetless.var.layout.ship = {
    {
        {"<tab>","<health>"},

        -- this row won't be present on npc's
        {"<pcship>","<fill>","<istand>","<sstand>","<ustand>"},
    },
    {
        {"<fill>","<distance>","<lstand>"},
    },
    {
        -- name is set to ship for npc's, playername for pc's.
        {"<tab>","<healthtext>","<name>","<fill>"},
    },
}


targetless.var.layout.pc = {
    {
        {"<fill>","<istand>","<sstand>","<ustand>","<lstand>"},
        {"<health>"},
    },
    {
        {"<name>"},
        {"<healthtext>","<pcship>","<fill>","<distance>"},
    },
}

targetless.var.layout.npc = {
    {
        {"<health>"},
    },
    {
        {"<fill>","<lstand>"},
    },
    {
        {"<healthtext>","<npcship>","<fill>","<distance>"},
    },
}

targetless.var.layout.cap = {
    {
        {"<health>"},
        -- {"<turrets>"}
    },
    {
        {"<fill>","<lstand>"},
    },
    {
        {"<healthtext>","<capship>","<fill>","<distance>"},
    },
}

targetless.var.layout.mycap = {
    {
        {"<tab>","<health>"},
    },
    {
        {"<tab>","<healthtext>","<capship>","<fill>","<distance>"},
    },
}

targetless.var.layout.roid = {
    {
        {"<tab>","<ore>","<fill>","<distance>"},
    },
}

--targetless.var.layout.pc = gkini.ReadString("targetless", "pclayout",
--    "[{<fill><istand><sstand><ustand><lstand>}{<health>}][{<name>}{<healthtext><pcship><fill><distance>}]")
--targetless.var.layout.npc = gkini.ReadString("targetless", "npclayout",
--    "[{<health>}][{<fill><lstand>}][{}{<healthtext><npcship><fill><distance>}]")
--targetless.var.layout.cap = gkini.ReadString("targetless", "npclayout",
--    "[{<health>}][{<fill><lstand>}][{}{<healthtext><npcship><fill><distance>}]")
--targetless.var.layout.roid = gkini.ReadString("targetless", "roidlayout", "{<tab><note><fill><id>}{<tab><ore>}")


-- factions enum
targetless.var.factions = {}
targetless.var.factions[12] = "Ineubis"
targetless.var.factions[6] = "Valent"
targetless.var.factions[99] = "Dev"
targetless.var.factions[1] = "Itani"
targetless.var.factions[3] = "Union"
targetless.var.factions[7] = "Orion"
targetless.var.factions[2] = "Serco"
targetless.var.factions[8] = "Axia"
targetless.var.factions[4] = "TPG"
targetless.var.factions[9] = "Corvus"
targetless.var.factions[0] = "Unaligned"
targetless.var.factions[10] = "Tunguska"
targetless.var.factions[5] = "BioCom"
targetless.var.factions[11] = "Aeolus"
targetless.var.factions[13] = "XangXi"

targetless.var.orecolor = {}
targetless.var.orecolor["Aq"] = "\127aec6d6Aq\127o"
targetless.var.orecolor["Si"] = "\1279c8a5fSi\127o"
targetless.var.orecolor["Ca"] = "\127749281Ca\127o"
targetless.var.orecolor["Fe"] = "\127a4a39bFe\127o"
targetless.var.orecolor["Is"] = "\12712d7e7Is\127o"
targetless.var.orecolor["Va"] = "\127dda994Va\127o"
targetless.var.orecolor["Xi"] = "\12716ef25Xi\127o"
targetless.var.orecolor["La"] = "\127a320e5La\127o"
targetless.var.orecolor["De"] = "\12713a2d9De\127o"
targetless.var.orecolor["Py"] = "\127e38163Py\127o"
targetless.var.orecolor["Ap"] = "\12725578dAp\127o"
targetless.var.orecolor["Pe"] = "\127f9f825Pe\127o"
targetless.var.orecolor["He"] = "\127d73d25He\127o"


-- icons
targetless.var.IMAGE_DIR = "plugins/tgfttl/images/"
targetless.var.images = {}
targetless.var.images.smile =
{
    iup.LoadImage("smile/POS.png"),
    iup.LoadImage("smile/admire.png"),
    iup.LoadImage("smile/respect.png"),
    iup.LoadImage("smile/neutral.png"),
    iup.LoadImage("smile/dislike.png"),
    iup.LoadImage("smile/hate.png"),
    iup.LoadImage("smile/KOS.png"),
    iup.LoadImage("smile/health.png"),
}
targetless.var.images.wheel =
{
    iup.LoadImage("wheel/POS.png"),
    iup.LoadImage("wheel/admire.png"),
    iup.LoadImage("wheel/respect.png"),
    iup.LoadImage("wheel/neutral.png"),
    iup.LoadImage("wheel/dislike.png"),
    iup.LoadImage("wheel/hate.png"),
    iup.LoadImage("wheel/KOS.png"),
    iup.LoadImage("wheel/health.png"),
}
