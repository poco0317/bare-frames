local t = Def.ActorFrame {}

t[#t+1] = Def.Quad {
    InitCommand = function(self)
        self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
        self:valign(0):halign(0)
        self:diffuse(color("0,0,0,1"))
    end
}

return t