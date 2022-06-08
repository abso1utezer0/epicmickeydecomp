-- Fully reworked

function StormBlot_SpitEmmitters()
  StartEmitterByName("StormBlot 01", "fx_stormblot_roar")
end

function StormBlot_SpitEmmittersStop()
  StopEmitterByName("StormBlot 01", "fx_stormblot_roar")
end

function StormBlot_HandEmmitters()
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime1")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime2")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime3")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime4")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime5")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime6")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime7")
  StartEmitterByName("StormBlot 01", "StormBlotFingerSlime8")
end