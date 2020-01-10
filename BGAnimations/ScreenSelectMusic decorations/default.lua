local t = Def.ActorFrame {}

t[#t+1] = LoadActor("profile")
t[#t+1] = LoadActor("songinfo")
t[#t+1] = LoadActor("search")

local wheelX = 15
local arbitraryWheelXThing = 17
local space = 20
local stepsdisplayx = wheelX + arbitraryWheelXThing + space + capWideScale(get43size(365),365)-50

t[#t + 1] =
	Def.ActorFrame {
	Name = "StepsDisplay",
	InitCommand = function(self)
		self:xy(stepsdisplayx, 20 + 10 * #ms.SkillSets + 30)
	end,
	OffCommand = function(self)
		self:visible(false)
	end,
	OnCommand = function(self)
		self:visible(true)
	end,
	CurrentSongChangedMessageCommand = function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:playcommand("On")
		elseif not song then
			self:playcommand("Off")
		end
	end,
	Def.StepsDisplayList {
		Name = "StepsDisplayListRow",
		CursorP1 = Def.ActorFrame {
			InitCommand = function(self)
				self:player(PLAYER_1)
			end,
			Def.Quad {
				InitCommand = function(self)
					self:x(54):zoomto(6, 20):halign(1):valign(0.5)
				end,
				BeginCommand = function(self)
					self:queuecommand("Set")
				end,
				SetCommand = function(self)
					self:zoomy(20)
				end
			}
		},
		CursorP2 = Def.ActorFrame {},
		CursorP1Frame = Def.Actor {
			ChangeCommand = function(self)
				self:stoptweening():decelerate(0.05)
			end
		},
		CursorP2Frame = Def.Actor {}
	}
}

return t