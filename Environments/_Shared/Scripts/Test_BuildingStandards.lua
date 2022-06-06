-- Fully reworked and explained

-- Setup intro for Building Standards
function EnemyIntro()
  StartFadeOut(0.8)
  RestrictCutSceneInput()
  wait(0.9)
  Enable("EnemySpawner")
  wait(0)
  PauseAllAI()
  TeleportToEntity(GetPlayer(), "MickeyTeleportMarker")
  wait(0.1)
  StartFadeIn(0.8)
  FireUser1("SpawnLookAt")
  GoToEntity("IntroEnemy", "IntroEnemyWalkToMarker")
  wait(10)
  UnrestrictCutSceneInput()
  UnpauseAllAI()
end