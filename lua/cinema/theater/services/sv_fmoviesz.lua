﻿-- This file is subject to copyright - contact swampservers@gmail.com for more information.
sv_GetVideoInfo = sv_GetVideoInfo or {}

sv_GetVideoInfo.fmoviesz = function(self, key, ply, onSuccess, onFailure)
    theater.GetVideoInfoClientside(self:GetClass(), key, ply, onSuccess, onFailure)
end