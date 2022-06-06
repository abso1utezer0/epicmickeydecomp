-- Fully reworked and explained

-- Restrict input and teleport to an entity
function Teleport(var1)
  RestrictCutSceneInput()
  StartFadeOut(0.5)
  Wait(1)
  TeleportToEntity(GetPlayer(), var1)
  StartFadeIn(3)
  Wait(1)
  UnrestrictCutSceneInput()
end

-- Restrict input and fade out/in
function Fade()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Wait(1)
  StartFadeIn(1)
  Wait(1)
  UnrestrictCutSceneInput()
end


-- Restrict input and fade out/in (longer & no hud)
function PlayMovieAdvanced()
  RestrictCutSceneInput()
  StartFadeOut(1)
  Wait(2)
  StartFadeInNoHUD(1)
  Wait(1)
  UnrestrictCutSceneInput()
end

-- Shake the camera (for Virtuos test level)
function ShakeCamera_Virtuos()
  ShakeCamera(1, 5, 0.05, 4, 0.025, 0.025)
end

-- Shake the camera
function ShakeCamera_Rock()
  ShakeCamera(5, 5, 0.05, 4, 0.025, 0.025)
end
