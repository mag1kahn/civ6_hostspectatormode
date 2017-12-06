-- TurnLastSlotIntoSpectator
-- Author: Fruitstrike
-- DateCreated: 4/12/2017 10:14:57 AM
--------------------------------------------------------------
function Initialize()
  if (Game.GetLocalPlayer() ~= -1) then
    numPlayers = PlayerManager.GetAliveMajorsCount();
   		
    local pVis = PlayersVisibility[numPlayers - 1];
	if (pVis) then
		for iPlotIndex = 0, Map.GetPlotCount()-1, 1 do
			--Set 2nd argument to to 1 to reveal all, Set to 0 to lead fog of war and avoid leader intros
			pVis:ChangeVisibilityCount(iPlotIndex, 1); 
		end
	end
  end

  print("-- Observer Remove Warrior!");
  --remove the warrior
  local pPlayer:table = Players[numPlayers - 1];

  if (pPlayer) then
    local pPlayerUnits:table = pPlayer:GetUnits();

    if (pPlayerUnits) then
      for i, pUnit in pPlayerUnits:Members() do
          pPlayer:GetUnits():Destroy(pUnit)
      end
    end

  end
end
Initialize();