local L0_0, L1_1
function L0_0()
  if GetGlobal("HUBHeroQuest") == 0 and GetGlobal("HUBScrapperQuest") == 0 then
    DialogBoxAdvanced("Accept hero quest to gather items for the town?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Not accepted.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Hero quest accepted. Gather the three items and place them in town.", 5)
      SetGlobal("HUBHeroQuest", 1)
    end
  elseif GetGlobal("HUBScrapperQuest") == 1 then
    Bark(GetPlayer(), "I don't wanna talk to you now that you are helping those ghosts.", 5)
  elseif GetGlobal("HUBHeroQuest") == 1 and GetGlobal("HUBWelcomeSign") < 2 or 2 > GetGlobal("HUBFlowerBox") or 2 > GetGlobal("HUB_Bell") then
    Bark(GetPlayer(), "Don't let us down. Come to me when you have returned all the items to their rightful places.", 5)
  elseif GetGlobal("HUBHeroQuest") == 1 and GetGlobal("HUBWelcomeSign") == 2 and GetGlobal("HUBFlowerBox") == 2 and GetGlobal("HUB_Bell") == 2 then
    Bark(GetPlayer(), "Quest completed. Door to Haunted Mansion opened.", 5)
    Wait(2)
    Hide("hub_nosquare_static.HUB_NOS_MiniHub_DoorsStandin 01 01")
  end
end
NOSHeroQuest = L0_0
function L0_0()
  if GetGlobal("HUBScrapperQuest") == 0 then
    DialogBoxAdvanced("Accept scrapper quest to gather npcs to be scared by ghosts?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Not accepted.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Scrapper quest accepted. Gather npcs one at a time at the spooky dock.", 5)
      SetGlobal("HUBScrapperQuest", 1)
    end
  elseif GetGlobal("HUBHeroQuest") == 1 then
    Bark(GetPlayer(), "I don't wanna talk to you now that you are helping those toons in town.", 5)
  elseif GetGlobal("HUBScrapperQuest") == 1 then
    Bark(GetPlayer(), "Don't let us down. This is serious business.", 5)
  end
end
NOSScrapperQuest = L0_0
function L0_0()
  if GetGlobal("HUBWelcomeSign") == 1 then
    Bark(GetPlayer(), "A suspicious looking Welcome Sign...", 5)
  elseif GetGlobal("HUBWelcomeSign") == 0 then
    DialogBoxAdvanced("Pick up Welcome Sign?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "You leave the sign where it lies.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "You pick up the Welcome Sign.", 5)
      SetGlobal("HUBWelcomeSign", 1)
    end
  end
end
NOSWelcomeSignGet = L0_0
function L0_0()
  if GetGlobal("HUBHeroQuest") == 1 then
    DialogBoxAdvanced("Pick up Flower Box?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "You leave the box where it is.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "You pick up the Flower Box.", 5)
      SetGlobal("HUBFlowerBox", 1)
    end
  elseif GetGlobal("HUBHeroQuest") == 0 then
    Bark(GetPlayer(), "A suspicious looking Flower Box...", 5)
  end
end
NOSFlowerBoxGet = L0_0
function L0_0()
  if GetGlobal("HUBHeroQuest") == 1 then
    DialogBoxAdvanced("Pick up Bell?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "You leave the Bell where it is.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "You pick up the Bell.", 5)
      SetGlobal("HUB_Bell", 1)
    end
  elseif GetGlobal("HUBHeroQuest") == 0 then
    Bark(GetPlayer(), "A suspicious looking Bell...", 5)
  end
end
NOSBellGet = L0_0
function L0_0()
  if GetGlobal("HUB_NPCScared") == 3 then
    Bark(GetPlayer(), "Did you hear? The gate to Haunted Mansion was just opened by the ghosts! Run!", 5)
  elseif GetGlobal("HUBScrapperQuest") == 1 and GetGlobal("HUB_NPCScared") < 3 then
    DialogBoxAdvanced("An idle npc. Ask him to accompany you to the swamp?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Hmm, not the right one I guess.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "The npc is now following you.", 5)
      SetGlobal("HUB_NPCFollow", 1)
    end
  elseif GetGlobal("HUBScrapperQuest") == 0 then
    Bark(GetPlayer(), "An idle npc...", 5)
  end
end
NOSNPCFollow = L0_0
function L0_0()
  if GetGlobal("HUB_NPCScared") == 3 then
    Bark(GetPlayer(), "The ghosts thank you and open the door to Haunted Mansion.", 5)
    Hide("hub_nosquare_static.HUB_NOS_MiniHub_DoorsStandin 01 01")
  elseif GetGlobal("HUBScrapperQuest") == 1 then
    DialogBoxAdvanced("The ghosts are in place. Let them scare the npc?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "You aren't sticking to the plan.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "The npc is terrified.", 5)
      SetGlobal("HUB_NPCScared", GetGlobal("HUB_NPCScared") + 1)
      SetGlobal("HUB_NPCFollow", 0)
    end
  elseif GetGlobal("HUBScrapperQuest") == 0 then
    Bark(GetPlayer(), "What a very spooky place this is...", 5)
  end
end
NOSScareNPC = L0_0
function L0_0()
  if GetGlobal("HUBWelcomeSign") == 1 then
    DialogBoxAdvanced("Place Welcome Sign in its proper place?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Keeping it for yourself?", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Sign placed", 5)
      SetGlobal("HUBWelcomeSign", 2)
    end
  elseif GetGlobal("HUBWelcomeSign") == 0 then
    Bark(GetPlayer(), "A broken sign post...", 5)
  end
end
NOSPlaceSign = L0_0
function L0_0()
  if GetGlobal("HUBFlowerBox") == 1 then
    DialogBoxAdvanced("Place Flower Box in its proper place?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Keeping it for yourself?", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Box placed", 5)
      SetGlobal("HUBFlowerBox", 2)
    end
  elseif GetGlobal("HUBFlowerBox") == 0 then
    Bark(GetPlayer(), "A less than fabulous railing...", 5)
  end
end
NOSPlaceBox = L0_0
function L0_0()
  if GetGlobal("HUB_Bell") == 1 then
    DialogBoxAdvanced("Place Bell in its proper place?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Keeping it for yourself?", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Bell placed", 5)
      SetGlobal("HUB_Bell", 2)
    end
  elseif GetGlobal("HUB_Bell") == 0 then
    Bark(GetPlayer(), "An old bell cradle...", 5)
  end
end
NOSPlaceBell = L0_0
function L0_0()
  Bark(GetPlayer(), "Come see us in the swamp. Don't talk to these townsfolk if you know whats good for ya.", 5)
  wait(6)
  Hide("hub_nosquare_dynamic.GenSign_Parade 13")
end
NOSGhostTalk = L0_0
L0_0 = 0
NOSSpatterCount = L0_0
function L0_0()
  Bark(GetPlayer(), "Visit 1 activated", 5)
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 03")
  Hide("hub_nosquare_ai.Generic_Female_Cow_Static 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 12")
  Hide("hub_nosquare_dynamic.GenSign_Parade 11")
  Hide("hub_nosquare.HUB_NOS_MiniHub_DoorsStandin 01 01")
  Hide("hub_nosquare.Generic_Male_Dog1_Static 04")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 05")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 06")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 07")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 08")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 09")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 02")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 07")
  Unhide("hub_nosquare_ai.GhostShort_Static 01")
  Unhide("hub_nosquare_ai.GhostShort_Static 02")
  Unhide("hub_nosquare_ai.GhostShort_Static 03")
  Unhide("hub_nosquare_ai.LonesomeGhostShort 01")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 06")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 09")
  Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 02")
  Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 01")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 04")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 05")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 13")
  SetGlobal("HUBWelcomeSign", 0)
  SetGlobal("HUBFlowerBox", 0)
  SetGlobal("HUB_Bell", 0)
  SetGlobal("HUB_NPCFollow", 0)
  SetGlobal("HUB_NPCScared", 0)
  SetGlobal("HUBHeroQuest", 0)
  SetGlobal("HUBScrapperQuest", 0)
  SetGlobal("HUBFlowerBox", 0)
  Destroy("hub_nosquare_ai.SpatterMelee 01")
  Destroy("hub_nosquare_ai.SpatterMelee 02")
  Destroy("hub_nosquare_ai.SpatterMelee 03")
end
NOSVisit1 = L0_0
function L0_0()
  Bark(GetPlayer(), "Visit 2 activated", 5)
  Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 03")
  Unhide("hub_nosquare_ai.Generic_Female_Cow_Static 01")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 12")
  Unhide("hub_nosquare_dynamic.GenSign_Parade 11")
  Hide("hub_nosquare.HUB_NOS_MiniHub_DoorsStandin 01 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 02")
  Hide("hub_nosquare_dynamic.GenSign_Parade 07")
  Hide("hub_nosquare_ai.GhostShort_Static 01")
  Hide("hub_nosquare_ai.GhostShort_Static 02")
  Hide("hub_nosquare_ai.GhostShort_Static 03")
  Hide("hub_nosquare_ai.LonesomeGhostShort 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 06")
  Hide("hub_nosquare_dynamic.GenSign_Parade 09")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 02")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 04")
  Hide("hub_nosquare_dynamic.GenSign_Parade 05")
  Hide("hub_nosquare_dynamic.GenSign_Parade 13")
  SetGlobal("HUBVoodooQuest", 0)
  SetGlobal("HUBVoodooDoll", 0)
  SetGlobal("HUB_BoatFilmClip", 0)
  SetGlobal("HUBIrisQuest", 0)
  Destroy("hub_nosquare_ai.SpatterMelee 01")
  Destroy("hub_nosquare_ai.SpatterMelee 02")
  Destroy("hub_nosquare_ai.SpatterMelee 03")
  Hide("hub_nosquare.Generic_Male_Dog1_Static 04")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 05")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 06")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 07")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 08")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 09")
end
NOSAfterHM = L0_0
function L0_0()
  Unhide("hub_nosquare_dynamic.Spawner 01")
  Unhide("hub_nosquare_dynamic.Spawner 02")
  Unhide("hub_nosquare_dynamic.Spawner 03")
  Enable("hub_nosquare_dynamic.Spawner 01")
  Enable("hub_nosquare_dynamic.Spawner 02")
  Enable("hub_nosquare_dynamic.Spawner 03")
  Bark(GetPlayer(), "Visit 3 activated", 5)
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 03")
  Hide("hub_nosquare_ai.Generic_Female_Cow_Static 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 12")
  Hide("hub_nosquare_dynamic.GenSign_Parade 11")
  Hide("hub_nosquare.HUB_NOS_MiniHub_DoorsStandin 01 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 02")
  Hide("hub_nosquare_dynamic.GenSign_Parade 07")
  Hide("hub_nosquare_ai.GhostShort_Static 01")
  Hide("hub_nosquare_ai.GhostShort_Static 02")
  Hide("hub_nosquare_ai.GhostShort_Static 03")
  Hide("hub_nosquare_ai.LonesomeGhostShort 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 06")
  Hide("hub_nosquare_dynamic.GenSign_Parade 09")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 02")
  Hide("hub_nosquare_ai.Generic_Male_Dog1_Static 01")
  Hide("hub_nosquare_dynamic.GenSign_Parade 04")
  Hide("hub_nosquare_dynamic.GenSign_Parade 05")
  Hide("hub_nosquare_dynamic.GenSign_Parade 13")
  SetGlobal("HUBSpatterCount", 0)
end
NOSVisit3 = L0_0
function L0_0()
  Bark(GetPlayer(), "The interior entrance to the sunken steamboat.", 5)
  wait(6)
  DialogBoxAdvanced("Enter sunken steamboat and retrieve the ghosts' film clip?", "Yes", "No")
  wait(0.25)
  if GetDialogResponse() == "No" then
    Bark(GetPlayer(), "I wouldn't either, its scary.", 5)
  elseif GetDialogResponse() == "Yes" then
    Bark(GetPlayer(), "Film clip recovered, so brave.", 5)
    SetGlobal("HUB_BoatFilmClip", 1)
  end
end
NOSBoatInterior = L0_0
function L0_0()
  if GetGlobal("HUBVoodooDoll") == 0 and GetGlobal("HUBVoodooQuest") == 0 then
    Bark(GetPlayer(), "Find my lost voodoo doll. Its in the swamp somewhere.", 5)
    SetGlobal("HUBVoodooQuest", 1)
  elseif GetGlobal("HUBVoodooDoll") == 0 and GetGlobal("HUBVoodooQuest") == 0 then
    Bark(GetPlayer(), "The doll should be in the swamp somewhere.", 5)
  elseif GetGlobal("HUBVoodooDoll") == 1 and GetGlobal("HUBVoodooQuest") == 1 then
    DialogBoxAdvanced("Give the voodoo doll back to her (Yes) or sell it to Pete later (No)?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Oh you really didn't have it? Ok then. (You keep it to sell it to Pete later) ", 5)
      SetGlobal("HUBVoodooQuest", 2)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Thanks for finding it. (You give her the voodoo doll)", 5)
      SetGlobal("HUBVoodooQuest", 2)
    end
  elseif GetGlobal("HUBVoodooQuest", 2) then
    Bark(GetPlayer(), "Quest completed. ", 5)
  end
end
NOSVoodooQuest = L0_0
function L0_0()
  if GetGlobal("HUBIrisQuest") == 0 then
    DialogBoxAdvanced("We could use some iris seeds from Clarabelle, got any handy? (Assume you have them)", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "Um ok, no flowers then I guess.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "Oh good, let me plant these and in time they should look great.", 5)
      SetGlobal("HUBIrisQuest", 1)
    end
  elseif SetGlobal("HUBIrisQuest") == 1 then
    Bark(GetPlayer(), "Patience. They need time to grow.", 5)
  end
end
NOSIrisPlant = L0_0
function L0_0()
  if GetGlobal("HUBVoodooQuest") == 1 and GetGlobal("HUBVoodooDoll") == 1 then
    Bark(GetPlayer(), "You have the doll, silly.", 5)
  elseif GetGlobal("HUBVoodooQuest") == 1 and GetGlobal("HUBVoodooDoll") == 0 then
    DialogBoxAdvanced("Pick up Voodoo Doll?", "Yes", "No")
    wait(0.25)
    if GetDialogResponse() == "No" then
      Bark(GetPlayer(), "You leave the doll where it is. Good idea.", 5)
    elseif GetDialogResponse() == "Yes" then
      Bark(GetPlayer(), "You pick up the doll", 5)
      SetGlobal("HUBVoodooDoll", 1)
    end
  elseif GetGlobal("HUBVoodooQuest") == 0 then
    Bark(GetPlayer(), "A nasty looking little doll...", 5)
  end
end
NOSVoodooDollGet = L0_0
function L0_0()
  Bark(GetPlayer(), "Mickey hurry! There's spatters everywhere!", 5)
end
NOSNPCSpatterWarn = L0_0
function L0_0()
  if GetGlobal("HUBSpatterCount") == 3 then
    Bark(GetPlayer(), "Hey everyone! Mickey got rid of the spatters! Yay!", 5)
    Unhide("hub_nosquare.Generic_Male_Dog1_Static 04")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 05")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 06")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 07")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 08")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 09")
  end
end
NOSSpattersDead = L0_0
function L0_0()
  Bark(GetPlayer(), "Thanks for cleaning up the town Mickey!", 5)
end
NOSThanksMickey = L0_0
function L0_0()
  SetGlobal("HUBSpatterCount", GetGlobal("HUBSpatterCount") + 1)
  if GetGlobal("HUBSpatterCount") == 3 then
    Bark(GetPlayer(), "Hey everyone! Mickey got rid of the spatters! Yay!", 5)
    Unhide("hub_nosquare.Generic_Male_Dog1_Static 04")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 05")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 06")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 07")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 08")
    Unhide("hub_nosquare_ai.Generic_Male_Dog1_Static 09")
  end
end
NOS_SpatterCountIncrease = L0_0
function L0_0()
  if GetGlobal("HUB_VisitNumber") == 2 then
    if GetGlobal("HUB_NO_Ticket1") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 09")
      Wait(0.25)
      SetGlobal("HUB_NO_Ticket1", 1)
    end
  elseif GetGlobal("HUB_VisitNumber") == 3 then
    if GetGlobal("HUB_NO_Ticket2") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 07")
      Wait(0.25)
      SetGlobal("HUB_NO_Ticket2", 1)
    end
  elseif GetGlobal("HUB_VisitNumber") == 4 then
    if GetGlobal("HUB_NO_Ticket3") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 05")
      Wait(0.25)
      SetGlobal("HUB_NO_Ticket3", 1)
    end
  elseif GetGlobal("HUB_VisitNumber") == 5 then
    if GetGlobal("HUB_NO_Ticket4") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 04")
      Wait(0.25)
      SetGlobal("HUB_NO_Ticket4", 1)
    end
  elseif GetGlobal("HUB_VisitNumber") == 6 then
    if GetGlobal("HUB_NO_Ticket5") == 0 then
      ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 06")
      Wait(0.25)
      SetGlobal("HUB_NO_Ticket5", 1)
    end
  elseif GetGlobal("HUB_VisitNumber") == 7 and GetGlobal("HUB_NO_Ticket6") == 0 then
    ForEachEntityInGroup(Enable, "hub_nosquare_dynamic.Spawner 08")
    Wait(0.25)
    SetGlobal("HUB_NO_Ticket6", 1)
  end
end
MSTicket1 = L0_0
function L0_0()
  if GetGlobal("HUB_AL_Camera1") == 1 and GetGlobal("HUB_MS_Camera4") == 1 and GetGlobal("HUB_TT_Camera3") == 1 then
    SetGlobal("HUB_NO_Camera2", 1)
    SetGlobal("HUB_CamerasDisabled", 1)
    Bark(GetPlayer(), "All security cameras Disabled...", 5, "", "GOD")
  elseif GetGlobal("HUB_NO_Camera2") == 0 then
    Bark(GetPlayer(), "Security Camera 2 Disabled...", 5, "", "GOD")
    SetGlobal("HUB_NO_Camera2", 1)
  end
end
HUBNewOrleansCamera = L0_0
function L0_0()
  SetGlobal("SeedPackCount", GetGlobal("SeedPackCount") + 1)
  Bark(GetPlayer(), "You found some seeds. Clarabelle in Toontown likes seeds.", 5, "", "GOD")
end
HUBNewOrleansSeeds = L0_0
function L0_0()
  if GetGlobal("HUB_NOS_Candle") == 1 then
    Bark(GetPlayer(), "You already found the candle here.", 5, "", "GOD")
  elseif GetGlobal("HUB_NOS_Candle") == 0 then
    IncrementGlobal("HUB_TT_CandleCount")
    IncrementGlobal("HUB_PickedUpCandle")
    SetGlobal("HUB_NOS_Candle", 1)
    Bark(GetPlayer(), "You discover a candle!", 5, "", "GOD")
  end
end
HUBNewOrleansCandle = L0_0
function L0_0()
  if GetGlobal("HUB_NOS_Candle2") == 1 then
    Bark(GetPlayer(), "You already found the candle here.", 5, "", "GOD")
  elseif GetGlobal("HUB_NOS_Candle2") == 0 then
    IncrementGlobal("HUB_TT_CandleCount")
    IncrementGlobal("HUB_PickedUpCandle")
    SetGlobal("HUB_NOS_Candle2", 1)
    Bark(GetPlayer(), "You discover a candle!", 5, "", "GOD")
  end
end
HUBNewOrleansCandle2 = L0_0
function L0_0(A0_2)
  AnimVarInt(A0_2, VAR_Mood_Type, MOOD_Negative)
  AnimEvent(A0_2, EVENT_Force_Idle)
end
HUB_NOS_NegativeBehaviorSetup = L0_0
function L0_0(A0_3)
  AnimVarInt(A0_3, VAR_Mood_Type, MOOD_Positive)
  AnimEvent(A0_3, EVENT_Force_Idle)
end
HUB_NOS_PositiveBehaviorSetup = L0_0
function L0_0(A0_4)
  AnimEvent(A0_4, EVENT_Start_Talk)
  Bark(A0_4, "Oh, hello there, Mickey!", 3, "", "Generic")
  wait(3)
  AnimVarInt(A0_4, VAR_Reaction_Type, REACTION_Negative)
  AnimEvent(A0_4, EVENT_Start_TalkReaction)
  Bark(A0_4, "Oswald says to hate you.", 3, "", "Generic")
  wait(3)
  AnimVarInt(A0_4, VAR_Reaction_Type, REACTION_Positive)
  AnimEvent(A0_4, EVENT_Start_TalkReaction)
  Bark(A0_4, "But everyone says you are ok.", 3, "", "Generic")
  wait(3)
  AnimVarInt(A0_4, VAR_Reaction_Type, REACTION_Shrug)
  AnimEvent(A0_4, EVENT_Start_TalkReaction)
  Bark(A0_4, "I just don't know what to make of you.", 3, "", "Generic")
  wait(3)
  DialogBoxAdvanced("What do you think of me?", "I like you", "I hate you", "", "", "", false)
  wait(0.1)
  if GetDialogResponse() == "No" then
    AnimVarInt(A0_4, VAR_Reaction_Type, REACTION_Negative)
    AnimEvent(A0_4, EVENT_Start_TalkReaction)
    AnimVarInt(A0_4, VAR_Mood_Type, MOOD_Negative)
    Bark(GetPlayer(), "Oswald was right about you, Mickey!", 3, "", "Generic")
    wait(3)
    AnimEvent(A0_4, EVENT_Finished_Sequence)
    AnimEvent(A0_4, EVENT_Force_Idle)
  elseif GetDialogResponse() == "Yes" then
    AnimVarInt(A0_4, VAR_Reaction_Type, REACTION_Positive)
    AnimEvent(A0_4, EVENT_Start_TalkReaction)
    AnimVarInt(A0_4, VAR_Mood_Type, MOOD_Positive)
    Bark(GetPlayer(), "Oh thank you Mickey! I knew Oswald was wrong about you.", 3, "", "Generic")
    wait(3)
    AnimEvent(A0_4, EVENT_Finished_Sequence)
    AnimEvent(A0_4, EVENT_Force_Idle)
  end
end
HUB_NOS_GenericQuest = L0_0
function L0_0(A0_5)
  AnimVarInt(A0_5, VAR_Mood_Type, MOOD_Negative)
  AnimEvent(A0_5, EVENT_Force_Idle)
end
HUB_NOS_SetupDonald = L0_0
function L0_0(A0_6)
  if GetGlobal("HUB_NOS_DaisyRing") == 0 then
    AnimEvent(A0_6, EVENT_Start_Talk)
    Bark(A0_6, "Oh No! Oh No! Oh No! I must have dropped it!", 4, "Donald", "Donald")
    wait(3)
    AnimVarInt(A0_6, VAR_Reaction_Type, REACTION_Negative)
    wait(0.1)
    AnimEvent(A0_6, EVENT_Start_TalkReaction)
    Bark(A0_6, "I got that ring for Daisy. It's why I went into the Haunted Mansion in the first place.", 5, "Donald", "Donald")
    wait(5)
    DialogBoxAdvanced("Mickey, will you go get that ring back from the ghost for me?", "Sure, Donald!", "No Way", "", "Donald", "", false)
    wait(0.1)
    if GetDialogResponse() == "No" then
      AnimEvent(A0_6, EVENT_Start_TalkReaction)
      Bark(GetPlayer(), "Oswald was right about you, Mickey!", 3, "Donald", "Donald")
      wait(3)
      AnimEvent(A0_6, EVENT_Finished_Sequence)
    elseif GetDialogResponse() == "Yes" then
      AnimVarInt(A0_6, VAR_Reaction_Type, REACTION_Positive)
      AnimEvent(A0_6, EVENT_Start_TalkReaction)
      Bark(GetPlayer(), "Oh thank you Mickey! I knew Oswald was wrong about you.", 3, "Donald", "Donald")
      wait(3)
      AnimEvent(A0_6, EVENT_Finished_Sequence)
    end
  end
end
HUB_NOS_DonaldQuest = L0_0
function L0_0()
  StartSequence(GetPlayer(), "fmv_endgame_B.bik:0:fmv_endgame_C.bik:0:fmv_endgame_D.bik:0:fmv_endgame_E.bik:0", false)
end
HUB_NOS_MovieCall = L0_0
