local gc = Var("GameCommand")
return Def.ActorFrame {
	LoadFont("Common Normal") ..
		{
			Text = THEME:GetString("ScreenTitleMenu", gc:GetText()),
			GainFocusCommand = function(self)
				self:zoom(0.57)
			end,
			LoseFocusCommand = function(self)
				self:zoom(0.55)
			end
		}
}
