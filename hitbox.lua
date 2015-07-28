-- Hitbox for VLC.

--[[

The MIT License (MIT)

Copyright (c) 2015 Nabile Rahmani

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]

function probe()
    return vlc.access:match("http[s]?") and string.match(vlc.path:match("([^/]+)"), "[%w+.]?hitbox.tv")
end

function parse()
    if string.match(vlc.path, "[%w+.]?hitbox.tv/video/[0-9]+") then
        local videoID = vlc.path:match("[%w+.]?hitbox.tv/video/([0-9]+)")

        return { { path = vlc.access .. "://www.hitbox.tv/api/player/hlsvod/" .. videoID .. ".m3u8" } }
    elseif string.match(vlc.path, "[%w+.]?hitbox.tv/[a-z0-9_]+") then
        local channel = vlc.path:match("[%w+.]?hitbox.tv/([a-z0-9_]+)")

        return { { path = vlc.access .. "://api.hitbox.tv/player/hls/" .. channel .. ".m3u8", title = channel .. "'s stream" } }
    end
end
