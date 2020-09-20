targetless.ui.controls = {}
targetless.ui.controls.element = {}
targetless.ui.controls.element.nextkey = iup.text { value = "" .. gkini.ReadString("targetless", "lsnext", "]"), size = "15x" }
targetless.ui.controls.element.prevkey = iup.text { value = "" .. gkini.ReadString("targetless", "lsprev", "["), size = "15x" }
targetless.ui.controls.element.targetnone = iup.text { value = "" .. gkini.ReadString("targetless", "targetnone", "U"), size = "15x" }
targetless.ui.controls.element.pinkey = iup.text { value = "" .. gkini.ReadString("targetless", "pin", "p"), size = "15x" }
targetless.ui.controls.element.pagekey = iup.text { value = "" .. gkini.ReadString("targetless", "lspage", "-"), size = "15x" }
targetless.ui.controls.element.cyclekey = iup.text { value = "" .. gkini.ReadString("targetless", "cyclestatus", "_"), size = "15x" }
targetless.ui.controls.element.lssort = iup.text { value = "" .. gkini.ReadString("targetless", "lssort", "o"), size = "15x" }
targetless.ui.controls.element.raddkey = iup.text { value = "" .. gkini.ReadString("targetless", "radd", "="), size = "15x" }
targetless.ui.controls.element.reditkey = iup.text { value = "" .. gkini.ReadString("targetless", "redit", "+"), size = "15x" }
targetless.ui.controls.element.unroidkey = iup.text { value = "" .. gkini.ReadString("targetless", "unroid", "|"), size = "15x" }
targetless.ui.controls.element.joyportmode = iup.list { value = "" .. gkini.ReadString("targetless", "joyportmode", "1"), dropdown="YES" }
targetless.ui.controls.element.joyporttarget = iup.list { value = "" .. gkini.ReadString("targetless", "joyporttarget", "1"), dropdown="YES" }
targetless.ui.controls.element.joymodaxislist = iup.list { value = "" .. gkini.ReadString("targetless", "joymodaxislist", "5"), dropdown="YES" }
targetless.ui.controls.element.joytaraxislist = iup.list { value = "" .. gkini.ReadString("targetless", "joytaraxislist", "6"), dropdown="YES", }
targetless.ui.controls.element.mmbuttonselect = iup.stationtoggle { title = "" }

targetless.ui.controls.numkeys = {}
targetless.ui.controls.numkeys.apply = iup.stationbutton { title = "Set #Keys" }
targetless.ui.controls.numkeys.tab = iup.vbox{
    iup.label { title = "\127ffffffSET # KEY controls:\127o\n\n\127eeeeeeThe following controls will be set:\n"..
        "\t'1' select target 1\n"..
        "\t'2' select target 2\n"..
--        "\t/bind '3' selecttarget3\n"..
        "\t.......\n"..
        "\t'0' select target 10\n"..
        "\t'p' pin target\n"..
        "\t'-' switch modes\n"..
        "\t'_' friendly/hostile\n"..
        "\t'=' add roid\n"..
        "\t'+' edit roid\n"..
	"\t'~' target unscanned roid\n",
        fgcolor = "255 255 255" },
    iup.fill{},
    iup.hbox
    {
      iup.fill {},
      iup.label { title = "This will overwrite the controls set to these keys.", fgcolor = "255 30 30" },
        iup.fill{},
        targetless.ui.controls.numkeys.apply,
    },
    margin="10x10",
	tabtitle="#Keys",
	hotkey=iup.K_k,
}
function targetless.ui.controls.numkeys.apply:action()
    gkinterface.GKProcessCommand("bind '1' selectTarget1")
    gkinterface.GKProcessCommand("bind '2' selectTarget2")
    gkinterface.GKProcessCommand("bind '3' selectTarget3")
    gkinterface.GKProcessCommand("bind '4' selectTarget4")
    gkinterface.GKProcessCommand("bind '5' selectTarget5")
    gkinterface.GKProcessCommand("bind '6' selectTarget6")
    gkinterface.GKProcessCommand("bind '7' selectTarget7")
    gkinterface.GKProcessCommand("bind '8' selectTarget8")
    gkinterface.GKProcessCommand("bind '9' selectTarget9")
    gkinterface.GKProcessCommand("bind '0' selectTarget10")
    gkinterface.GKProcessCommand("bind '-' lsswitch")
    gkinterface.GKProcessCommand("bind '_' cyclestatus")
    gkinterface.GKProcessCommand("bind '=' addroid")
    gkinterface.GKProcessCommand("bind '+' editroid")
    gkinterface.GKProcessCommand("bind '~' unroid")
end

targetless.ui.controls.mouse = {}
targetless.ui.controls.mouse.apply = iup.stationbutton { title = "Set Mouse" }
targetless.ui.controls.mouse.tab = iup.vbox{
    iup.label { title = "SET Mouse controls:" },
    iup.fill {},
    iup.label { title = "The following controls will be set:" },
    iup.label { title = "" },
    iup.hbox
    {
    iup.vbox
    {
    iup.label { title = "MWHEELUP" },
    iup.label { title = "MWHEELDOWN     " },
    iup.label { title = "MMBUTTON" },
    },
    iup.vbox
    {
    iup.label { title = "target prev", alignment = "ARIGHT" },
    iup.label { title = "target next" },
    iup.label { title = "change modes" },
    },
    iup.vbox
    {
      iup.label { title = "" },
      iup.label { title = "" },
      iup.hbox
      {
	iup.label { title = "    " },
        targetless.ui.controls.element.mmbuttonselect,
      },
    },
    },
    iup.fill{},
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "This will overwrite the controls set to these keys.", fgcolor = "255 30 30" },
        iup.fill{},
        targetless.ui.controls.mouse.apply,
    },
    margin="10x10",
	tabtitle="Mouse",
	hotkey=iup.K_m,
}
function targetless.ui.controls.mouse.apply:action()
    gkinterface.GKProcessCommand("bind 'MWHEELUP' prevLS")
    gkinterface.GKProcessCommand("bind 'MWHEELDOWN' nextLS")
    if targetless.ui.controls.element.mmbuttonselect.value == "ON" then
      gkinterface.GKProcessCommand("bind 'MMBUTTON' lsswitch")
    end
end

targetless.ui.controls.joystick = {}
targetless.ui.controls.joystick.apply = iup.stationbutton { title = "Set Joystick" }
targetless.ui.controls.joystick.tab = iup.vbox {
  iup.fill {},
  iup.hbox
  {
    iup.fill {},
    iup.vbox
    {
      iup.fill {},
      iup.label{title = "" },
      iup.hbox
      {
	iup.fill {},
        targetless.ui.controls.element.joyportmode,
	iup.label { title = " " },
      },
      iup.hbox
      {
	iup.fill {},
        targetless.ui.controls.element.joymodaxislist,
	iup.label { title = " " },
      },
      iup.fill {},
      iup.label{title = "" },
      iup.hbox
      {
        iup.fill {},
	targetless.ui.controls.element.joyporttarget,
	iup.label { title = " " },
      },
      iup.hbox
      {
        iup.fill {},
	targetless.ui.controls.element.joytaraxislist,
	iup.label { title = " " },
      },
    },
    iup.vbox
    {
      iup.fill {},
      iup.label { title = " Mode Select ", bgcolor = "0 100 0", fgcolor = "255 255 255" },
      iup.label { title = "  Joystick Port" },
      iup.label { title = "     Select Axis" },
      iup.fill {},
      iup.label { title = " Target Select", bgcolor = "0 100 0", fgcolor = "255 255 255" },
      iup.label { title = "  Joystick Port" },
      iup.label { title = "     Select Axis" },
    },
  },
  iup.fill {},
  iup.hbox
  {
    iup.fill {},
    iup.label { title = "This will overwrite the controls set to these ports.  ", fgcolor = "255 30 30" },
    targetless.ui.controls.joystick.apply,
  },
  margin="10x10",
  tabtitle="Joystick",
  hotkey=iup.K_j,
}

function targetless.ui.controls.gettargetaxis(joyport)
	local numaxis = joystick.GetJoystickNumAxes(joyport-1)
	for y = 1, numaxis do
		targetless.ui.controls.element.joytaraxislist[y] = joystick.GetJoystickData(joyport-1).AxisNames[y]
	end
	targetless.ui.controls.element.joytaraxislist[numaxis+1] = nil--sets end of list
	iup.Refresh(targetless.ui.controls.element.joytaraxislist)
	return numaxis
end

function targetless.ui.controls.getmodeaxis(joyport)
	local numaxis = joystick.GetJoystickNumAxes(joyport-1)
	for y = 1, numaxis do
		targetless.ui.controls.element.joymodaxislist[y] = joystick.GetJoystickData(joyport-1).AxisNames[y]
	end
	targetless.ui.controls.element.joymodaxislist[numaxis+1] = nil--sets end of list
	iup.Refresh(targetless.ui.controls.element.joymodaxislist)
	return numaxis
end

function targetless.ui.controls.getjoysticks()
	local numjoysticks = 0
	for x = 0, 9 do
		if joystick.GetJoystickData(x) then
			local joystickname = joystick.GetJoystickData(x).Name
			numjoysticks = numjoysticks +1
			targetless.ui.controls.element.joyportmode[numjoysticks] = joystickname
			targetless.ui.controls.element.joyporttarget[numjoysticks] = joystickname
		end
	end
	if tonumber(targetless.var.joystickmodeport) > numjoysticks then
		targetless.var.joystickmodeport = ''
	end
	if tonumber(targetless.var.joysticktarport) > numjoysticks then
		targetless.var.joysticktarport = ''
	end
	return numjoysticks
end

function targetless.ui.controls.element.joyportmode:action(axis,item,state)
  if state == 1 then
    targetless.ui.controls.getmodeaxis(targetless.ui.controls.element.joyportmode.value)
  end
end

function targetless.ui.controls.element.joyporttarget:action(axis,item,state)
  if state == 1 then
    targetless.ui.controls.gettargetaxis(targetless.ui.controls.element.joyporttarget.value)
  end
end

function targetless.ui.controls.joychange(self,newtab,oldtab)
	if newtab == targetless.ui.controls.joystick.tab then
		local numjoystick = targetless.ui.controls.getjoysticks()
		if numjoystick then
			if tonumber(targetless.var.joystickmodeport) < 1 then targetless.var.joystickmodeport = '1' end
			targetless.ui.controls.element.joyportmode.value = tonumber(targetless.var.joystickmodeport)
			iup.Refresh(targetless.ui.controls.element.joyportmode)
			local numaxis = targetless.ui.controls.getmodeaxis(tonumber(targetless.var.joystickmodeport))
			if tonumber(targetless.var.joystickmodaxis) <= numaxis then
				targetless.ui.controls.element.joymodaxislist.value = tonumber(targetless.var.joystickmodaxis)
			end
			if tonumber(targetless.var.joysticktarport) < 1 then targetless.var.joysticktarport = '1' end
			targetless.ui.controls.element.joyporttarget.value = tonumber(targetless.var.joysticktarport)
			iup.Refresh(targetless.ui.controls.element.joyporttarget)
			local numaxis = targetless.ui.controls.gettargetaxis(tonumber(targetless.var.joysticktarport))
			if tonumber(targetless.var.joysticktaraxis) <= numaxis then
				targetless.ui.controls.element.joytaraxislist.value = tonumber(targetless.var.joysticktaraxis)
			end
		else print ('No Joystick Detected')
		end
	end
end
function targetless.ui.controls.joystick.apply:action()
  print('Applying joystick settings')
  gkini.WriteString("targetless", "joyportmode", targetless.ui.controls.element.joyportmode.value)
  targetless.var.joystickmodeport=targetless.ui.controls.element.joyportmode.value
  gkini.WriteString("targetless", "joymodaxislist", targetless.ui.controls.element.joymodaxislist.value)
  targetless.var.joystickmodaxis=targetless.ui.controls.element.joymodaxislist.value
  gkinterface.BindJoystickCommand(targetless.var.joystickmodeport-1,targetless.var.joystickmodaxis,'joyswitch')
  print('Mode switch is '..targetless.ui.controls.element.joyportmode[targetless.var.joystickmodeport]..'  '..targetless.ui.controls.element.joymodaxislist[targetless.var.joystickmodaxis])
  gkini.WriteString("targetless", "joyporttarget", targetless.ui.controls.element.joyporttarget.value)
  targetless.var.joysticktarport=targetless.ui.controls.element.joyporttarget.value
  gkini.WriteString("targetless", "joytaraxislist", targetless.ui.controls.element.joytaraxislist.value)
  targetless.var.joysticktaraxis=targetless.ui.controls.element.joytaraxislist.value
  gkinterface.BindJoystickCommand(targetless.var.joysticktarport-1,targetless.var.joysticktaraxis,'joyLS')
  print('Target switch is '..targetless.ui.controls.element.joyporttarget[targetless.var.joysticktarport]..'  '..targetless.ui.controls.element.joytaraxislist[targetless.var.joysticktaraxis])
end

targetless.ui.controls.custom = {}
targetless.ui.controls.custom.apply = iup.stationbutton { title = "Set Custom" }
targetless.ui.controls.custom.tab =
    iup.vbox
    { margin = "10x",
    iup.fill {},
    iup.hbox
    {
      iup.fill {},
        iup.label { title = "pin/unpin (ship):  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.pinkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "cycle (modes):  ", fgcolor = "255 255 255", },
        targetless.ui.controls.element.pagekey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "cycle (friendly/hostile):  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.cyclekey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "add roid (manually):  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.raddkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "edit roid (already scanned):  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.reditkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "target nearest unscanned roid:  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.unroidkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "target next:  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.nextkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "target previous:  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.prevkey,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "target none (replaces RadarNone):  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.targetnone,
    },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "cycle sort:  ", fgcolor = "255 255 255" },
        targetless.ui.controls.element.lssort,
    },
    iup.label { title = "" },
    iup.hbox
    {
        iup.fill {},
        iup.label { title = "This will overwrite the controls set to these keys.  ", fgcolor = "255 30 30" },
        targetless.ui.controls.custom.apply,
    },
    margin="10x10",
    tabtitle="Custom",
    hotkey=iup.K_u,
}
function targetless.ui.controls.custom.apply:action()
    if(targetless.ui.controls.element.nextkey ~= "") then
        local nextkey = targetless.ui.controls.element.nextkey.value
        gkini.WriteString("targetless", "lsnext", nextkey)
        if(#nextkey == 1) then nextkey = "'"..nextkey.."'" end
        gkinterface.GKProcessCommand("bind "..nextkey.." nextLS")
    end
    if(targetless.ui.controls.element.prevkey ~= "") then
        local prevkey = targetless.ui.controls.element.prevkey.value
        gkini.WriteString("targetless", "lsprev", prevkey)
        if(#prevkey == 1) then prevkey = "'"..prevkey.."'" end
        gkinterface.GKProcessCommand("bind "..prevkey.." prevLS")
    end
    if(targetless.ui.controls.element.targetnone ~= "") then
        local targetnone = targetless.ui.controls.element.targetnone.value
        gkini.WriteString("targetless", "targetnone", targetnone)
        if(#targetnone == 1) then targetnone = "'"..targetnone.."'" end
        gkinterface.GKProcessCommand("bind "..targetnone.." targetnone")
    end
    if(targetless.ui.controls.element.pinkey ~= "") then
        local pinkey = targetless.ui.controls.element.pinkey.value
        gkini.WriteString("targetless", "pin", pinkey)
        if(#pinkey == 1) then pinkey = "'"..pinkey.."'" end
        gkinterface.GKProcessCommand("bind "..pinkey.." pin")
    end
    if(targetless.ui.controls.element.pagekey ~= "") then
        local pagekey = targetless.ui.controls.element.pagekey.value
        gkini.WriteString("targetless", "lspage", pagekey)
        if(#pagekey == 1) then pagekey = "'"..pagekey.."'" end
        gkinterface.GKProcessCommand("bind "..pagekey.." lsswitch")
    end
    if(targetless.ui.controls.element.cyclekey ~= "") then
        local cyclekey = targetless.ui.controls.element.cyclekey.value
        gkini.WriteString("targetless", "cyclestatus", cyclekey)
        if(#cyclekey == 1) then cyclekey = "'"..cyclekey.."'" end
        gkinterface.GKProcessCommand("bind "..cyclekey.." cyclestatus")
    end
    if(targetless.ui.controls.element.lssort ~= "") then
        local lssort = targetless.ui.controls.element.lssort.value
        gkini.WriteString("targetless", "lssort", lssort)
        if(#lssort == 1) then lssort = "'"..lssort.."'" end
        gkinterface.GKProcessCommand("bind "..lssort.." lssort")
    end
    if(targetless.ui.controls.element.raddkey ~= "") then
        local raddkey = targetless.ui.controls.element.raddkey.value
        gkini.WriteString("targetless", "radd", raddkey)
        if(#raddkey == 1) then raddkey = "'"..raddkey.."'" end
        gkinterface.GKProcessCommand("bind "..raddkey.." addroid")
    end
    if(targetless.ui.controls.element.reditkey ~= "") then
        local reditkey = targetless.ui.controls.element.reditkey.value
        gkini.WriteString("targetless", "redit", reditkey)
        if(#reditkey == 1) then reditkey = "'"..reditkey.."'" end
        gkinterface.GKProcessCommand("bind "..reditkey.." editroid")
    end

    if(targetless.ui.controls.element.unroidkey ~= "") then
        local unroidkey = targetless.ui.controls.element.unroidkey.value
        gkini.WriteString("targetless", "unroid", unroidkey)
        if(#unroidkey == 1) then unroidkey = "'"..unroidkey.."'" end
        gkinterface.GKProcessCommand("bind "..unroidkey.." unroid")
    end


    if(targetless.ui.controls.element.cyclekey ~= "") then
        local cyclekey = targetless.ui.controls.element.cyclekey.value
        gkini.WriteString("targetless", "cyclestatus", cyclekey)
        if(#cyclekey == 1) then cyclekey = "'"..cyclekey.."'" end
        gkinterface.GKProcessCommand("bind "..cyclekey.." cyclestatus")
    end
end

targetless.ui.controls.main = iup.subsubsubtabtemplate{
    targetless.ui.controls.custom.tab,
    targetless.ui.controls.numkeys.tab,
    targetless.ui.controls.mouse.tab,
    targetless.ui.controls.joystick.tab,
      tabchange_cb = function (self,newtab,oldtab)
      targetless.ui.controls.joychange(self,newtab,oldtab)
      end,
}

targetless.ui.controls.main.tabtitle="Controls"
targetless.ui.controls.main.hotkey=iup.K_c
iup.Detach(targetless.ui.controls.main[1][1][1][1][2])

function targetless.ui.controls.main:OnShow()
    targetless.ui.controls.element.nextkey.value = ""..gkini.ReadString("targetless", "lsnext", "]")
    targetless.ui.controls.element.prevkey.value = ""..gkini.ReadString("targetless", "lsprev", "[")
    targetless.ui.controls.element.targetnone.value = ""..gkini.ReadString("targetless", "targetnone", "U")
    targetless.ui.controls.element.pinkey.value = ""..gkini.ReadString("targetless", "pin", "p")
    targetless.ui.controls.element.pagekey.value = ""..gkini.ReadString("targetless", "lspage", "-")
    targetless.ui.controls.element.cyclekey.value = ""..gkini.ReadString("targetless", "cyclestatus", "_")
    targetless.ui.controls.element.raddkey.value = ""..gkini.ReadString("targetless", "radd", "=")
    targetless.ui.controls.element.reditkey.value = ""..gkini.ReadString("targetless", "redit", "+")
    targetless.ui.controls.element.unroidkey.value = ""..gkini.ReadString("targetless", "unroid", "|")
end

function targetless.ui.controls.main:OnHide() end
