function switchAudioOutput()
	audioOutputs = hs.audiodevice.allOutputDevices()
	defaultOutput = hs.audiodevice.defaultOutputDevice()

	devCount = 0
	for i, dev in ipairs(audioOutputs) do
		print(dev)
		devCount = devCount + 1
		if dev == defaultOutput then
			currDevIdx = i
		end
	end

	while true do
		print(currDevIdx)
		currDevIdx = currDevIdx + 1
		if currDevIdx > devCount then currDevIdx = 1 end
		defaultOutput = audioOutputs[currDevIdx]
		ok = defaultOutput:setDefaultOutputDevice()
		bal = defaultOutput:balance()
		-- print(bal) TODO check if the output is 'good'
		-- and bal ~= nil
		if ok  then break end
	end

	return defaultOutput
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", function()
	newDev = switchAudioOutput()
	hs.notify.new({title="Hammerspoon", informativeText="Switched output to: " .. newDev:name()}):send()
end)

