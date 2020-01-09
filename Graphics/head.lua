return LoadFont("Common Normal") .. {
    OnCommand = function(self)
        self:settext(SCREENMAN:GetTopScreen():GetName())
    end
}