local t = Def.ActorFrame {}

local wheelX = 15
local arbitraryWheelXThing = 17
local space = 20
local meter = {}
meter[1] = 0

local function makeSSes()
    local ss = Def.ActorFrame {}
    local function makeSS(i)
        return LoadFont("Common Normal") .. {
            InitCommand = function(self)
                self:y(10 * i)
                self:zoom(.3)
                self:halign(0)
            end,
            CurrentStepsP1ChangedMessageCommand = function(self)
                if not steps then
                    self:settextf("%s:", ms.SkillSetsTranslated[i])
                else
                    self:settextf("%s: %5.2f", ms.SkillSetsTranslated[i], meter[i])
                end
            end
        }
    end
    for i = 1, #ms.SkillSets do
        ss[#ss+1] = makeSS(i)
    end
    return ss
end

t[#t+1] = Def.ActorFrame {
    InitCommand = function(self)
        self:x(wheelX + arbitraryWheelXThing + space + capWideScale(get43size(365),365)-50)
        self:y(20)
    end,
    CurrentStepsP1ChangedMessageCommand = function(self)
        steps = GAMESTATE:GetCurrentSteps()
        if steps then
            meter = {}
            for i = 1, #ms.SkillSets do
                local m = steps:GetMSD(getCurRateValue(), i)
                meter[i] = m
            end
        end
    end,

    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:zoom(.5):halign(0)
            self:settextf("Song Rating")
        end
    },
    makeSSes() .. {
        InitCommand = function(self)
            self:y(10)
        end
    }
}

return t