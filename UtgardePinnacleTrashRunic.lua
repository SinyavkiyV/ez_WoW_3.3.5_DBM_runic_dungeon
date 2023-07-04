local mod	= DBM:NewMod("UtgardePinnacleTrash", "DBM-Party-WotLK", 11)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 3933 $"):sub(12, -3))

mod:RegisterEvents(
	"SPELL_DAMAGE"
)

local specWarnBitingCold	= mod:NewSpecialWarningMove(62188, false)

do 
	local lastbitingcold = 0
	function mod:SPELL_DAMAGE(args)
		if args:IsSpellID(62038, 62188) and args:IsPlayer() and time() - lastbitingcold > 4 then		-- Biting Cold
			specWarnBitingCold:Show()
			lastbitingcold = time()
		end
	end
end