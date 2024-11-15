# swampservers/contrib

Please read the **COPYRIGHT** notice of the bottom of this page. If you contribute to this repository, then you agree to the **CONTRIBUTOR LICENSE AGREEMENT** also at the bottom of this page.

# Overview

Contribute to Swamp Cinema here! How to:

- 'Fork' this repo. This creates a copy of it you have edit permissions of.
- Clone your forked repo into garrysmod/addons (so it creates garrysmod/addons/contrib), edit it, and push it back. You'll need the GitHub desktop or commandline client. Look up GitHub tutorials for that.
- For clientside work, check out the [devtools](https://github.com/swampservers/contrib/blob/master/lua/swamp/dev/cl_devtools.lua) which allow you to work on the actual server environment.
- Make a pull request on this repo. Use the 'compare across forks' link to request to merge your changes on your forked repo to this repo. Accepted changes are installed automatically, although new files won't run until after a server reset.
- Minor, single-file changes can just be done in the web browser by clicking the pencil icon.

All models/materials/sounds in this repository will be automatically uploaded to our workshop addons, so don't worry about that.

# Code

- Please submit code that is **clean and concise**. You may want to run it through [glualint](https://fptje.github.io/glualint-web/). Do a good job! 
- Make your code compatible with our [loading system](https://github.com/swampservers/contrib/blob/master/lua/autorun/swamp.lua).
- Try to put cinema-specific code in gamemodes/cinema/ and generic (cross-server) code in lua/. Both folders are loaded using our loading system.


# Code Style

Name stuff like this. A lot of current code doesn't conform, but this is the style:
- local my_var = 1
- local function my_func()
- tab.data_member = 1
- GlobalVariable = 1
- function GlobalFunc()
- function tab:FunctionMember() -- use this naming for callable tables as well
- panel.ChildPanel = ui.Label()
- CONSTANT_VALUE = 1

Never use capital letters when naming local vars/functions

# API


### gm = engine.ActiveGamemode()
Shorthand for gamemode name
\
*file: [lua/autorun/swamp.lua](https://github.com/swampservers/contrib/blob/master/lua/autorun/swamp.lua)*

### function Entity:GetLocation()
Int location ID
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function Entity:GetLocationName()
String
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function Entity:GetLocationTable()
Location table
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function Entity:GetTheater()
Theater table
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function Entity:InTheater()
Bool
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function FindLocation(ent_or_pos)
Global function to compute a location ID (avoid this, it doesn't cache)
\
*file: [lua/cinema/location/sh_location.lua](https://github.com/swampservers/contrib/blob/master/lua/cinema/location/sh_location.lua)*

### function Player:ExtEmitSound(sound, options)
Will probably be deprecated\
 possible options:\
 pitch\
 crouchpitch\
 level\
 volume\
 channel\
 ent: emit from this ent instead of player\
 shared: emit on client without networking, assuming called in shared function\
 speech: move player lips (time to move lips, or auto if < 0)
\
*file: [lua/cinema/sound/sh_extsound.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/cinema/sound/sh_extsound.lua)*

### function Entity:IsProtected(att)
If we are "protected" from this attacker by theater protection. `att` doesn't need to be passed, it's only used to let theater owners override protection and prevent killing out of a protected area.
\
*file: [lua/cinema/theater/sh_protection.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/cinema/theater/sh_protection.lua)*

### function Player:GetRank()
Numeric player ranking (all players are zero, staff are 1+)
\
*file: [lua/swamp/admin/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/admin/sh_init.lua)*

### function Player:IsStaff()
Boolean
\
*file: [lua/swamp/admin/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/admin/sh_init.lua)*

### function Player:IsTyping()
Bool (typing a chat message)
\
*file: [lua/swamp/chat/sh_swampchat.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/chat/sh_swampchat.lua)*

### Font = memo(function(setting_str)
Generates a font quickly. Caches so it can be used in paint hooks.\
 Example input: draw.DrawText("based", Font.Arial24)
\
*file: [lua/swamp/cl_font.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/cl_font.lua)*

### function GetTextSize(font, text)
surface.GetTextSize with cached result
\
*file: [lua/swamp/cl_font.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/cl_font.lua)*

### function Player:IsAFK()
Boolean
\
*file: [lua/swamp/clientcheck/sh_afk_detect.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/clientcheck/sh_afk_detect.lua)*

### function Player:IsActive()
Boolean, NOT AFK and NOT BOT
\
*file: [lua/swamp/clientcheck/sh_afk_detect.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/clientcheck/sh_afk_detect.lua)*

### function bench(func)
Prints how long it takes to run a function, averaging over a large number of samples with minimal overhead
\
*file: [lua/swamp/dev/sh_bench.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/dev/sh_bench.lua)*

### function Ply(name)
For hacking/debugging. FindSinglePlayer but just returns nil if matches multiple.
\
*file: [lua/swamp/dev/sh_util.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/dev/sh_util.lua)*

### Me  (global variable)
Use this global instead of LocalPlayer()\
 It will be either nil or a valid entity. Don't write `if IsValid(Me)`... , just write `if Me`...
\
*file: [lua/swamp/extensions/cl_me.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_me.lua)*

### function MeOnValid(func)
Call the function when Me becomes valid
\
*file: [lua/swamp/extensions/cl_me.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_me.lua)*

### function cam.Culled3D2D(pos, ang, scale, callback)
Runs `cam.Start3D2D(pos, ang, scale) callback() cam.End3D2D()` but only if the user is in front of the "screen" so they can see it.
\
*file: [lua/swamp/extensions/cl_render_extension.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_render_extension.lua)*

### function render.DrawingScreen()
Bool if we are currently drawing to the screen.
\
*file: [lua/swamp/extensions/cl_render_extension.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_render_extension.lua)*

### function render.WithColorModulation(r, g, b, callback)
Sets the color modulation, calls your callback, then sets it back to what it was before.
\
*file: [lua/swamp/extensions/cl_render_extension.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_render_extension.lua)*

### function DFrame:CloseOnEscape()
Call this to make a DFrame dissapear if the user hits escape
\
*file: [lua/swamp/extensions/cl_vgui_function.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_vgui_function.lua)*

### function vgui(classname, parent (optional), constructor)
This defines the function vgui(classname, parent (optional), constructor) which creates and returns a panel.\
\
 The parent should only be passed when creating a root element (eg. a DFrame) which need a parent.\
 Child elements should be constructed using vgui() from within the parent's constructor, and their parent will be set automatically.\
\
 This is helpful for creating complex guis as the hierarchy of the layout is clearly reflected in the code structure.\
\
 Example: (a better example is in the file)\
 ```\
 vgui("Panel", function(p)\
    -- p is the panel, set it up here\
    vgui("DLabel", function(p)\
        -- p is the label here\
    end)\
 end)\
 ```
\
*file: [lua/swamp/extensions/cl_vgui_function.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/cl_vgui_function.lua)*

### function Anim(init, force, callback)
Makes an "anim" which smoothly interpolates a value\
 init = default value\
 force = acceleration towards target value\
 callback runs when value changes (return true to stop updating, but this happens automatically when target is reached)\
 returned table has functions __call() to get the current value, SetTarget(value) to set a target, SetInstant(value) to jump and set velocity to zero
\
*file: [lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_anim.lua)*

### function AnimValue(subject, key, init_or_force, force)
Anim which will set a named property on a subject (entity or panel)\
 The value is placed at ent.Key and the anim is at ent.KeyAnim
\
*file: [lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_anim.lua)*

### function Entity:TimerCreate(identifier, delay, repetitions, callback)
A timer which will only call the callback (with the entity passed as the argument) if the ent is still valid
\
*file: [lua/swamp/extensions/sh_ent_timer.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_ent_timer.lua)*

### function Entity:TimerSimple(delay, callback)
A timer which will only call the callback (with the entity passed as the argument) if the ent is still valid
\
*file: [lua/swamp/extensions/sh_ent_timer.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_ent_timer.lua)*

### Ents  (global variable)
A global cache of all entities, in subtables divided by classname.\
 Works on client and server. Much, much faster than `ents.FindByClass` or even `player.GetAll`\
 Each subtable is ordered and will never be nil even if no entities were created.\
 To use it try something like this: `for i,v in ipairs(Ents.prop_physics) do` ...
\
*file: [lua/swamp/extensions/sh_ents_cache.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_ents_cache.lua)*

### ply.NWP = {}
NWP="Networked Private"\
 A table on each player. Values written on server will automatically be replicated to that client. Won't be sent to other players. Read-only on client, read-write on server.
\
*file: [lua/swamp/extensions/sh_nwprivate.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_nwprivate.lua)*

### function Entity:IsHuman()
IsPlayer and not IsBot
\
*file: [lua/swamp/extensions/sh_player_extension.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_player_extension.lua)*

### function Player:UsingWeapon(class)
Faster than writing `IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass()==class`
\
*file: [lua/swamp/extensions/sh_player_extension.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_player_extension.lua)*

### function FindSinglePlayer(name, exact_overrides_multiple)
Find a player whose name contains some text. If it finds exactly one matching player, returns that player. Otherwise, returns the number of found players (0 or >=2). To use this check isnumber() on the return.
\
*file: [lua/swamp/extensions/sh_playerbyname.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_playerbyname.lua)*

### function string.FormatSeconds(sec)
Turns a number of seconds into a string like hh:mm:ss or mm:ss
\
*file: [lua/swamp/extensions/sh_string.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/extensions/sh_string.lua)*

### function ShowMotd(url)
Pop up the MOTD browser thing with this URL
\
*file: [lua/swamp/misc/cl_motd.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/cl_motd.lua)*

### function Player:Notify(...)
Show a notification (bottow center screen popup). OK to call on invalid players (does nothing).
\
*file: [lua/swamp/misc/sh_notify.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/sh_notify.lua)*

### function Player:TrueName()
Return player's actual Steam name without any filters (eg removing swamp.sv). All default name functions have filters.
\
*file: [lua/swamp/misc/sh_player_name_filter.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/sh_player_name_filter.lua)*

### function player.GetBySteamID(id)
Unlike the built-in function, this (along with player.GetBySteamID64 and player.GetByAccountID) is fast.
\
*file: [lua/swamp/misc/sh_playerbysteamid.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/sh_playerbysteamid.lua)*

### function Player:GetTitle()
Get current title string or ""
\
*file: [lua/swamp/misc/sh_titles.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/sh_titles.lua)*

### function Player:RateLimit(name, interval, burst)
Rate limiter for net recievers and commands and whatnot. Interval is how many seconds between each action. Burst is how many we can do fast (default 1).\
 The function returns TRUE if the action should be blocked, FALSE if it should be ALLOWED. So do like `if ply:RateLimit("thing", 1, 1) then return end` to rate limit everything after it.\
 Call it with no arguments to use a default reasonable value for clickable actions or whatever.
\
*file: [lua/swamp/misc/sv_swamp_misc.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/misc/sv_swamp_misc.lua)*

### function Entity:IsPony()
Boolean, mostly for players
\
*file: [lua/swamp/pony/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/pony/sh_init.lua)*

### function API_Struct(value_type)
A struct is a table with only string keys, and all string keys are kept on the NetworkString table. It's not as static as a C struct.
\
*file: [lua/swamp/sh_api.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_api.lua)*

### if CLIENT then
Register a function which is called on the server and executed on the client. See this file for details.
\
*file: [lua/swamp/sh_api.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_api.lua)*

### Table = Table or memo(function() return {} end)
Global cache/generator for tables\
 Use to localize tables that can't be cleared on file refresh or have to sync in multiple files\
 local stuff = Table.MyWeaponStuff
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function basememo(func, params)
Returns a table such that when indexing the table, if the value doesn't exist, the constructor will be called with the key to initialize it.\
 function defaultdict(constructor, args)\
    assert(args==nil)\
    return setmetatable(args or {}, {\
        __index = function(tab, key)\
            local d = constructor(key)\
            tab[key] = d\
            return d\
        end,\
        __mode = mode\
    })\
 end\
 -- __mode = weak and "v" or nil\
 local memofunc = {\
    function(func)\
        return setmetatable({}, {\
            __index = function(tab, key)\
                local d = func(key)\
                tab[key] = d\
                return d\
            end\
        })\
    end\
 }\
 for i=2,10 do\
    local nextmemo = memofunc[i-1]\
    memofunc[i] = function(func, weak)\
        return memo(function(arg)\
            return nextmemo[funci(function(arg) return func(arg) end, weak)\
        end, weak)\
    end\
 end
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function call(func, ...)
Just calls the function with the args
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function call_async(callback, ...)
Shorthand timer.Simple(0, callback) and also passes args
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function math.nextpow2(n)
Returns next power of 2 >= n
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function memo(func, params)
Wraps a function with a cache to store computations when the same arguments are reused. Google: Memoization\
 The returned memo should be "called" by indexing it:\
 a = memo(function(x,y) return x*y end)\
 print(a[2][3]) --prints 6\
 If the function returns nil, nothing will be stored, and the second return value will be returned by the indexing.\
 params are extra things to put in the metatable (eg __mode), or index 1 can be a default initialization for the table
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function noop()
Shorthand for empty function
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.Equal(a, b, epsilon)
Check if tables contain the same data, even if they are different tables (deep copy OK)
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.Inverse(tab)
Convert a table of {k=v} to {v=k}
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.Set(tab)
Convert an ordered table {a,b,c} into a set {[a]=true,[b]=true,[c]=true}
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.ShallowCopy(tab)
Copy table at the first layer only
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.SortedInsertIndex(tab, val)
Returns the largest index such that tab[index] > val (or is the end)
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.imax(tab)
Selects the maximum value of an ordered table. See also: table.imin
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.isum(tab)
Sums an ordered table.
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function table.sub(tab, startpos, endpos)
Selects a range of an ordered table similar to string.sub
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function try(func, catch)
Calls the function and if it fails, calls catch (default: ErrorNoHaltWithStack) with the error. Doesn't return anything
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### function weakref(value)
weak reference, call it to get the thing or nil if its gone
\
*file: [lua/swamp/sh_init.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_init.lua)*

### Player, Entity, Weapon  (global variables)
Omit FindMetaTable from your code because these globals always refer to their respective metatables.\
 Player/Entity are still callable and function the same as the default global functions.
\
*file: [lua/swamp/sh_meta.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sh_meta.lua)*

### function Player:GetPoints()
Number of points
\
*file: [lua/swamp/shop/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/shop/sh_init.lua)*

### function Player:HasPoints(points)
If the player has at least this many points. Don't use it on the server if you are about to buy something; just do TryTakePoints
\
*file: [lua/swamp/shop/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/shop/sh_init.lua)*

### function Entity:OrthoBounds(angle, offset)
Returns min,max such that the rotated bbox render.DrawWireframeBox(Vector(0,0,0), angle, min, max) tightly bounds the entity's model in world space. no angle means Angle(0,0,0). if offset it gets applied in world space
\
*file: [lua/swamp/shop/sh_modelbounds.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/shop/sh_modelbounds.lua)*

### function Player:GivePoints(points, callback, fcallback)
Give points. `callback` happens once the points are written. `fcallback` = failed to write
\
*file: [lua/swamp/shop/sv_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/shop/sv_init.lua)*

### function Player:TryTakePoints(points, callback, fcallback)
Take points, but only if they have enough.\
 `callback` runs once the points have been taken.\
 `fcallback` runs if they don't have enough points or it otherwise fails to take them
\
*file: [lua/swamp/shop/sv_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/shop/sv_init.lua)*

### function Player:GetStat(name, default)
Get the value of the stat with the given name. If default isn't given it is 0
\
*file: [lua/swamp/sql/sh_stats.lua](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sh_stats.lua)*

### Redis = memo(function(k)
Call this like: Redis.Get("a", callback(value) end) or Redis({"get","a"}, {"get","b"}, callback(values) end)
\
*file: [lua/swamp/sql/sv_init_redis.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sv_init_redis.lua)*

### function Player:AddStat(name, increment)
Adds increment (or 1) to a stat with the given name
\
*file: [lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sv_stats.lua)*

### function Player:FlagStat(name)
Sets the stat to 1 (cheaper storage than integer stats)
\
*file: [lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sv_stats.lua)*

### function Player:GroupStat(name, other)
Adds the other player to the "partner set" by the given name. This way you can make stats that require interaction with many players.
\
*file: [lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sv_stats.lua)*

### function Player:MaxStat(name, record)
Sets the stat with the given name to the max of its previous value and the record
\
*file: [lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/sql/sv_stats.lua)*

### function Entity:SetWebMaterial(args)
Like `WebMaterial` but sets it to an entity (only needs to be called once)\
 The material will load when the entity is close unless `args.forceload=true` is passed.
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function Entity:SetWebSubMaterial(idx, args)
Like `Entity:SetWebMaterial`
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function ITexture:Redraw(callback)
Assign a function to this ITexture which will be called(width,height) on the next PreDrawHUD and with the rendertarget/viewport stuff setup.\
 Finishes all painting in order on one frame and can be called recursively.
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function RenderTarget(args)
Like CreateRenderTargetEx, but the args are a table with good defaults, you don't need a name, and if the ITexture gets garbage collected it can reuse the rendertarget for another call (since you can't delete RTs)
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function WebMaterial(args)
To use web materials, just call in your draw hook:\
\
 `mat = WebMaterial(args)`\
\
 Then set/override material to mat\
\
 args is a table with the following potential keys:\
 - id: string, from `SanitizeImgurId`\
 - owner: player/steamid or nil\
 - pos: vector or nil - rendering position, used for delayed distance loading\
 - stretch: bool = false (stretch to fill frame, or contain to maintain aspect)\
 - shader: str = "VertexLitGeneric"\
 - params: str = "{}" - A "table" of material parameters for CreateMaterial (NOT A TABLE, A STRING THAT CAN BE PARSED AS A TABLE)\
 - pointsample: bool = false\
 - nsfw: bool = false - (can be false, true, or "?")
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function weaktable(kv, initial)
a weak table is like a table that has paper hands and keeps dropping key/value pairs
\
*file: [lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function AsyncSanitizeImgurId(id, callback)
Like SanitizeImgurId, but more powerful (if a url to an gallery is passed we'll try to look it up)
\
*file: [lua/swamp/webmaterials/sh_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/sh_webmaterials.lua)*

### function SanitizeImgurId(id)
Converts an imgur id or url to an imgur id (nil if it doesn't work)
\
*file: [lua/swamp/webmaterials/sh_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/sh_webmaterials.lua)*

### function SingleAsyncSanitizeImgurId(url, callback)
Like AsyncSanitizeImgurId but won't spam requests (waits until the previous request finished, and only the latest request can stay in the queue)
\
*file: [lua/swamp/webmaterials/sh_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/lua/swamp/webmaterials/sh_webmaterials.lua)*

### function DFrame:CloseOnEscape()
Call this to make a DFrame dissapear if the user hits escape
\
*file: [compile/lua/swamp/extensions/cl_vgui_function.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/extensions/cl_vgui_function.lua)*

### function vgui(classname, parent (optional), constructor)
This defines the function vgui(classname, parent (optional), constructor) which creates and returns a panel.\
\
 The parent should only be passed when creating a root element (eg. a DFrame) which need a parent.\
 Child elements should be constructed using vgui() from within the parent's constructor, and their parent will be set automatically.\
\
 This is helpful for creating complex guis as the hierarchy of the layout is clearly reflected in the code structure.\
\
 Example: (a better example is in the file)\
 ```\
 vgui("Panel", function(p)\
    -- p is the panel, set it up here\
    vgui("DLabel", function(p)\
        -- p is the label here\
    end)\
 end)\
 ```
\
*file: [compile/lua/swamp/extensions/cl_vgui_function.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/extensions/cl_vgui_function.lua)*

### function Anim(init, force, callback)
Makes an "anim" which smoothly interpolates a value\
 init = default value\
 force = acceleration towards target value\
 callback runs when value changes (return true to stop updating, but this happens automatically when target is reached)\
 returned table has functions __call() to get the current value, SetTarget(value) to set a target, SetInstant(value) to jump and set velocity to zero
\
*file: [compile/lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/extensions/sh_anim.lua)*

### function AnimValue(subject, key, init_or_force, force)
Anim which will set a named property on a subject (entity or panel)\
 The value is placed at ent.Key and the anim is at ent.KeyAnim
\
*file: [compile/lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/extensions/sh_anim.lua)*

### Ents  (global variable)
A global cache of all entities, in subtables divided by classname.\
 Works on client and server. Much, much faster than `ents.FindByClass` or even `player.GetAll`\
 Each subtable is ordered and will never be nil even if no entities were created.\
 To use it try something like this: `for i,v in ipairs(Ents.prop_physics) do` ...
\
*file: [compile/lua/swamp/extensions/sh_ents_cache.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/extensions/sh_ents_cache.lua)*

### function player.GetBySteamID(id)
Unlike the built-in function, this (along with player.GetBySteamID64 and player.GetByAccountID) is fast.
\
*file: [compile/lua/swamp/misc/sh_playerbysteamid.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/misc/sh_playerbysteamid.lua)*

### function Player:GetTitle()
Get current title string or ""
\
*file: [compile/lua/swamp/misc/sh_titles.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/misc/sh_titles.lua)*

### function Player:RateLimit(name, interval, burst)
Rate limiter for net recievers and commands and whatnot. Interval is how many seconds between each action. Burst is how many we can do fast (default 1).\
 The function returns TRUE if the action should be blocked, FALSE if it should be ALLOWED. So do like `if ply:RateLimit("thing", 1, 1) then return end` to rate limit everything after it.\
 Call it with no arguments to use a default reasonable value for clickable actions or whatever.
\
*file: [compile/lua/swamp/misc/sv_swamp_misc.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/misc/sv_swamp_misc.lua)*

### function API_Struct(value_type)
A struct is a table with only string keys, and all string keys are kept on the NetworkString table. It's not as static as a C struct.
\
*file: [compile/lua/swamp/sh_api.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_api.lua)*

### if CLIENT then
Register a function which is called on the server and executed on the client. See this file for details.
\
*file: [compile/lua/swamp/sh_api.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_api.lua)*

### Table = Table or memo(function() return {} end)
Global cache/generator for tables\
 Use to localize tables that can't be cleared on file refresh or have to sync in multiple files\
 local stuff = Table.MyWeaponStuff
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function basememo(func, params)
Returns a table such that when indexing the table, if the value doesn't exist, the constructor will be called with the key to initialize it.\
 function defaultdict(constructor, args)\
    assert(args==nil)\
    return setmetatable(args or {}, {\
        __index = function(tab, key)\
            local d = constructor(key)\
            tab[key] = d\
            return d\
        end,\
        __mode = mode\
    })\
 end\
 -- __mode = weak and "v" or nil\
 local memofunc = {\
    function(func)\
        return setmetatable({}, {\
            __index = function(tab, key)\
                local d = func(key)\
                tab[key] = d\
                return d\
            end\
        })\
    end\
 }\
 for i=2,10 do\
    local nextmemo = memofunc[i-1]\
    memofunc[i] = function(func, weak)\
        return memo(function(arg)\
            return nextmemo[funci(function(arg) return func(arg) end, weak)\
        end, weak)\
    end\
 end
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function call(func, ...)
Just calls the function with the args
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function call_async(callback, ...)
Shorthand timer.Simple(0, callback) and also passes args
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function math.nextpow2(n)
Returns next power of 2 >= n
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function memo(func, params)
Wraps a function with a cache to store computations when the same arguments are reused. Google: Memoization\
 The returned memo should be "called" by indexing it:\
 a = memo(function(x,y) return x*y end)\
 print(a[2][3]) --prints 6\
 If the function returns nil, nothing will be stored, and the second return value will be returned by the indexing.\
 params are extra things to put in the metatable (eg __mode), or index 1 can be a default initialization for the table
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function noop()
Shorthand for empty function
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.Equal(a, b, epsilon)
Check if tables contain the same data, even if they are different tables (deep copy OK)
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.Inverse(tab)
Convert a table of {k=v} to {v=k}
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.Set(tab)
Convert an ordered table {a,b,c} into a set {[a]=true,[b]=true,[c]=true}
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.ShallowCopy(tab)
Copy table at the first layer only
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.SortedInsertIndex(tab, val)
Returns the largest index such that tab[index] > val (or is the end)
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.imax(tab)
Selects the maximum value of an ordered table. See also: table.imin
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.isum(tab)
Sums an ordered table.
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function table.sub(tab, startpos, endpos)
Selects a range of an ordered table similar to string.sub
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function try(func, catch)
Calls the function and if it fails, calls catch (default: ErrorNoHaltWithStack) with the error. Doesn't return anything
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function weakref(value)
weak reference, call it to get the thing or nil if its gone
\
*file: [compile/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sh_init.lua)*

### function Player:GivePoints(points, callback, fcallback)
Give points. `callback` happens once the points are written. `fcallback` = failed to write
\
*file: [compile/lua/swamp/shop/sv_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/shop/sv_init.lua)*

### function Player:TryTakePoints(points, callback, fcallback)
Take points, but only if they have enough.\
 `callback` runs once the points have been taken.\
 `fcallback` runs if they don't have enough points or it otherwise fails to take them
\
*file: [compile/lua/swamp/shop/sv_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/shop/sv_init.lua)*

### function Player:GetStat(name, default)
Get the value of the stat with the given name. If default isn't given it is 0
\
*file: [compile/lua/swamp/sql/sh_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sh_stats.lua)*

### Redis = memo(function(k)
Call this like: Redis.Get("a", callback(value) end) or Redis({"get","a"}, {"get","b"}, callback(values) end)
\
*file: [compile/lua/swamp/sql/sv_init_redis.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sv_init_redis.lua)*

### function Player:AddStat(name, increment)
Adds increment (or 1) to a stat with the given name
\
*file: [compile/lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sv_stats.lua)*

### function Player:FlagStat(name)
Sets the stat to 1 (cheaper storage than integer stats)
\
*file: [compile/lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sv_stats.lua)*

### function Player:GroupStat(name, other)
Adds the other player to the "partner set" by the given name. This way you can make stats that require interaction with many players.
\
*file: [compile/lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sv_stats.lua)*

### function Player:MaxStat(name, record)
Sets the stat with the given name to the max of its previous value and the record
\
*file: [compile/lua/swamp/sql/sv_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/sql/sv_stats.lua)*

### function Entity:SetWebMaterial(args)
Like `WebMaterial` but sets it to an entity (only needs to be called once)\
 The material will load when the entity is close unless `args.forceload=true` is passed.
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function Entity:SetWebSubMaterial(idx, args)
Like `Entity:SetWebMaterial`
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function ITexture:Redraw(callback)
Assign a function to this ITexture which will be called(width,height) on the next PreDrawHUD and with the rendertarget/viewport stuff setup.\
 Finishes all painting in order on one frame and can be called recursively.
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function RenderTarget(args)
Like CreateRenderTargetEx, but the args are a table with good defaults, you don't need a name, and if the ITexture gets garbage collected it can reuse the rendertarget for another call (since you can't delete RTs)
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function WebMaterial(args)
To use web materials, just call in your draw hook:\
\
 `mat = WebMaterial(args)`\
\
 Then set/override material to mat\
\
 args is a table with the following potential keys:\
 - id: string, from `SanitizeImgurId`\
 - owner: player/steamid or nil\
 - pos: vector or nil - rendering position, used for delayed distance loading\
 - stretch: bool = false (stretch to fill frame, or contain to maintain aspect)\
 - shader: str = "VertexLitGeneric"\
 - params: str = "{}" - A "table" of material parameters for CreateMaterial (NOT A TABLE, A STRING THAT CAN BE PARSED AS A TABLE)\
 - pointsample: bool = false\
 - nsfw: bool = false - (can be false, true, or "?")
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### function weaktable(kv, initial)
a weak table is like a table that has paper hands and keeps dropping key/value pairs
\
*file: [compile/lua/swamp/webmaterials/cl_webmaterials.lua (hidden)](https://github.com/swampservers/contrib/blob/master/compile/lua/swamp/webmaterials/cl_webmaterials.lua)*

### gm = engine.ActiveGamemode()
Shorthand for gamemode name
\
*file: [repos/contrib/lua/autorun/swamp.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/autorun/swamp.lua)*

### function Entity:GetLocation()
Int location ID
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### function Entity:GetLocationName()
String
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### function Entity:GetLocationTable()
Location table
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### function Entity:GetTheater()
Theater table
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### function Entity:InTheater()
Bool
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### function FindLocation(ent_or_pos)
Global function to compute a location ID (avoid this, it doesn't cache)
\
*file: [repos/contrib/lua/cinema/location/sh_location.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/cinema/location/sh_location.lua)*

### Font = memo(function(setting_str)
Generates a font quickly. Caches so it can be used in paint hooks.\
 Example input: draw.DrawText("based", Font.Arial24)
\
*file: [repos/contrib/lua/swamp/cl_font.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/cl_font.lua)*

### function GetTextSize(font, text)
surface.GetTextSize with cached result
\
*file: [repos/contrib/lua/swamp/cl_font.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/cl_font.lua)*

### function bench(func)
Prints how long it takes to run a function, averaging over a large number of samples with minimal overhead
\
*file: [repos/contrib/lua/swamp/dev/sh_bench.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/dev/sh_bench.lua)*

### function Ply(name)
For hacking/debugging. FindSinglePlayer but just returns nil if matches multiple.
\
*file: [repos/contrib/lua/swamp/dev/sh_util.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/dev/sh_util.lua)*

### Me  (global variable)
Use this global instead of LocalPlayer()\
 It will be either nil or a valid entity. Don't write `if IsValid(Me)`... , just write `if Me`...
\
*file: [repos/contrib/lua/swamp/extensions/cl_me.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_me.lua)*

### function MeOnValid(func)
Call the function when Me becomes valid
\
*file: [repos/contrib/lua/swamp/extensions/cl_me.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_me.lua)*

### function cam.Culled3D2D(pos, ang, scale, callback)
Runs `cam.Start3D2D(pos, ang, scale) callback() cam.End3D2D()` but only if the user is in front of the "screen" so they can see it.
\
*file: [repos/contrib/lua/swamp/extensions/cl_render_extension.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_render_extension.lua)*

### function render.DrawingScreen()
Bool if we are currently drawing to the screen.
\
*file: [repos/contrib/lua/swamp/extensions/cl_render_extension.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_render_extension.lua)*

### function render.WithColorModulation(r, g, b, callback)
Sets the color modulation, calls your callback, then sets it back to what it was before.
\
*file: [repos/contrib/lua/swamp/extensions/cl_render_extension.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_render_extension.lua)*

### function DFrame:CloseOnEscape()
Call this to make a DFrame dissapear if the user hits escape
\
*file: [repos/contrib/lua/swamp/extensions/cl_vgui_function.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_vgui_function.lua)*

### function vgui(classname, parent (optional), constructor)
This defines the function vgui(classname, parent (optional), constructor) which creates and returns a panel.\
\
 The parent should only be passed when creating a root element (eg. a DFrame) which need a parent.\
 Child elements should be constructed using vgui() from within the parent's constructor, and their parent will be set automatically.\
\
 This is helpful for creating complex guis as the hierarchy of the layout is clearly reflected in the code structure.\
\
 Example: (a better example is in the file)\
 ```\
 vgui("Panel", function(p)\
    -- p is the panel, set it up here\
    vgui("DLabel", function(p)\
        -- p is the label here\
    end)\
 end)\
 ```
\
*file: [repos/contrib/lua/swamp/extensions/cl_vgui_function.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/cl_vgui_function.lua)*

### function Entity:TimerCreate(identifier, delay, repetitions, callback)
A timer which will only call the callback (with the entity passed as the argument) if the ent is still valid
\
*file: [repos/contrib/lua/swamp/extensions/sh_ent_timer.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_ent_timer.lua)*

### function Entity:TimerSimple(delay, callback)
A timer which will only call the callback (with the entity passed as the argument) if the ent is still valid
\
*file: [repos/contrib/lua/swamp/extensions/sh_ent_timer.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_ent_timer.lua)*

### Ents  (global variable)
A global cache of all entities, in subtables divided by classname.\
 Works on client and server. Much, much faster than `ents.FindByClass` or even `player.GetAll`\
 Each subtable is ordered and will never be nil even if no entities were created.\
 To use it try something like this: `for i,v in ipairs(Ents.prop_physics) do` ...
\
*file: [repos/contrib/lua/swamp/extensions/sh_ents_cache.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_ents_cache.lua)*

### ply.NWP = {}
NWP="Networked Private"\
 A table on each player. Values written on server will automatically be replicated to that client. Won't be sent to other players. Read-only on client, read-write on server.
\
*file: [repos/contrib/lua/swamp/extensions/sh_nwprivate.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_nwprivate.lua)*

### function Entity:IsHuman()
IsPlayer and not IsBot
\
*file: [repos/contrib/lua/swamp/extensions/sh_player_extension.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_player_extension.lua)*

### function Player:UsingWeapon(class)
Faster than writing `IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass()==class`
\
*file: [repos/contrib/lua/swamp/extensions/sh_player_extension.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_player_extension.lua)*

### function FindSinglePlayer(name, exact_overrides_multiple)
Find a player whose name contains some text. If it finds exactly one matching player, returns that player. Otherwise, returns the number of found players (0 or >=2). To use this check isnumber() on the return.
\
*file: [repos/contrib/lua/swamp/extensions/sh_playerbyname.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_playerbyname.lua)*

### function string.FormatSeconds(sec)
Turns a number of seconds into a string like hh:mm:ss or mm:ss
\
*file: [repos/contrib/lua/swamp/extensions/sh_string.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/extensions/sh_string.lua)*

### function ShowMotd(url)
Pop up the MOTD browser thing with this URL
\
*file: [repos/contrib/lua/swamp/misc/cl_motd.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/misc/cl_motd.lua)*

### function Player:Notify(...)
Show a notification (bottow center screen popup). OK to call on invalid players (does nothing).
\
*file: [repos/contrib/lua/swamp/misc/sh_notify.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/misc/sh_notify.lua)*

### function Player:TrueName()
Return player's actual Steam name without any filters (eg removing swamp.sv). All default name functions have filters.
\
*file: [repos/contrib/lua/swamp/misc/sh_player_name_filter.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/misc/sh_player_name_filter.lua)*

### function player.GetBySteamID(id)
Unlike the built-in function, this (along with player.GetBySteamID64 and player.GetByAccountID) is fast.
\
*file: [repos/contrib/lua/swamp/misc/sh_playerbysteamid.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/misc/sh_playerbysteamid.lua)*

### function Player:GetTitle()
Get current title string or ""
\
*file: [repos/contrib/lua/swamp/misc/sh_titles.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/misc/sh_titles.lua)*

### function Entity:IsPony()
Boolean, mostly for players
\
*file: [repos/contrib/lua/swamp/pony/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/pony/sh_init.lua)*

### function API_Struct(value_type)
A struct is a table with only string keys, and all string keys are kept on the NetworkString table. It's not as static as a C struct.
\
*file: [repos/contrib/lua/swamp/sh_api.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_api.lua)*

### if CLIENT then
Register a function which is called on the server and executed on the client. See this file for details.
\
*file: [repos/contrib/lua/swamp/sh_api.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_api.lua)*

### Table = Table or memo(function() return {} end)
Global cache/generator for tables\
 Use to localize tables that can't be cleared on file refresh or have to sync in multiple files\
 local stuff = Table.MyWeaponStuff
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function basememo(func, params)
Returns a table such that when indexing the table, if the value doesn't exist, the constructor will be called with the key to initialize it.\
 function defaultdict(constructor, args)\
    assert(args==nil)\
    return setmetatable(args or {}, {\
        __index = function(tab, key)\
            local d = constructor(key)\
            tab[key] = d\
            return d\
        end,\
        __mode = mode\
    })\
 end\
 -- __mode = weak and "v" or nil\
 local memofunc = {\
    function(func)\
        return setmetatable({}, {\
            __index = function(tab, key)\
                local d = func(key)\
                tab[key] = d\
                return d\
            end\
        })\
    end\
 }\
 for i=2,10 do\
    local nextmemo = memofunc[i-1]\
    memofunc[i] = function(func, weak)\
        return memo(function(arg)\
            return nextmemo[funci(function(arg) return func(arg) end, weak)\
        end, weak)\
    end\
 end
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function call(func, ...)
Just calls the function with the args
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function call_async(callback, ...)
Shorthand timer.Simple(0, callback) and also passes args
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function math.nextpow2(n)
Returns next power of 2 >= n
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function memo(func, params)
Wraps a function with a cache to store computations when the same arguments are reused. Google: Memoization\
 The returned memo should be "called" by indexing it:\
 a = memo(function(x,y) return x*y end)\
 print(a[2][3]) --prints 6\
 If the function returns nil, nothing will be stored, and the second return value will be returned by the indexing.\
 params are extra things to put in the metatable (eg __mode), or index 1 can be a default initialization for the table
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function noop()
Shorthand for empty function
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.Equal(a, b, epsilon)
Check if tables contain the same data, even if they are different tables (deep copy OK)
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.Inverse(tab)
Convert a table of {k=v} to {v=k}
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.Set(tab)
Convert an ordered table {a,b,c} into a set {[a]=true,[b]=true,[c]=true}
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.ShallowCopy(tab)
Copy table at the first layer only
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.SortedInsertIndex(tab, val)
Returns the largest index such that tab[index] > val (or is the end)
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.imax(tab)
Selects the maximum value of an ordered table. See also: table.imin
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.isum(tab)
Sums an ordered table.
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function table.sub(tab, startpos, endpos)
Selects a range of an ordered table similar to string.sub
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function try(func, catch)
Calls the function and if it fails, calls catch (default: ErrorNoHaltWithStack) with the error. Doesn't return anything
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### function weakref(value)
weak reference, call it to get the thing or nil if its gone
\
*file: [repos/contrib/lua/swamp/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_init.lua)*

### Player, Entity, Weapon  (global variables)
Omit FindMetaTable from your code because these globals always refer to their respective metatables.\
 Player/Entity are still callable and function the same as the default global functions.
\
*file: [repos/contrib/lua/swamp/sh_meta.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sh_meta.lua)*

### function Player:GetStat(name, default)
Get the value of the stat with the given name. If default isn't given it is 0
\
*file: [repos/contrib/lua/swamp/sql/sh_stats.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/contrib/lua/swamp/sql/sh_stats.lua)*

### function Player:ExtEmitSound(sound, options)
Will probably be deprecated\
 possible options:\
 pitch\
 crouchpitch\
 level\
 volume\
 channel\
 ent: emit from this ent instead of player\
 shared: emit on client without networking, assuming called in shared function\
 speech: move player lips (time to move lips, or auto if < 0)
\
*file: [repos/restricted/lua/cinema/sound/sh_extsound.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/cinema/sound/sh_extsound.lua)*

### function Entity:IsProtected(att)
If we are "protected" from this attacker by theater protection. `att` doesn't need to be passed, it's only used to let theater owners override protection and prevent killing out of a protected area.
\
*file: [repos/restricted/lua/cinema/theater/sh_protection.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/cinema/theater/sh_protection.lua)*

### function Player:IsTyping()
Bool (typing a chat message)
\
*file: [repos/restricted/lua/swamp/chat/sh_swampchat.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/chat/sh_swampchat.lua)*

### function Anim(init, force, callback)
Makes an "anim" which smoothly interpolates a value\
 init = default value\
 force = acceleration towards target value\
 callback runs when value changes (return true to stop updating, but this happens automatically when target is reached)\
 returned table has functions __call() to get the current value, SetTarget(value) to set a target, SetInstant(value) to jump and set velocity to zero
\
*file: [repos/restricted/lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/extensions/sh_anim.lua)*

### function AnimValue(subject, key, init_or_force, force)
Anim which will set a named property on a subject (entity or panel)\
 The value is placed at ent.Key and the anim is at ent.KeyAnim
\
*file: [repos/restricted/lua/swamp/extensions/sh_anim.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/extensions/sh_anim.lua)*

### function Player:GetPoints()
Number of points
\
*file: [repos/restricted/lua/swamp/shop/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/shop/sh_init.lua)*

### function Player:HasPoints(points)
If the player has at least this many points. Don't use it on the server if you are about to buy something; just do TryTakePoints
\
*file: [repos/restricted/lua/swamp/shop/sh_init.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/shop/sh_init.lua)*

### function Entity:OrthoBounds(angle, offset)
Returns min,max such that the rotated bbox render.DrawWireframeBox(Vector(0,0,0), angle, min, max) tightly bounds the entity's model in world space. no angle means Angle(0,0,0). if offset it gets applied in world space
\
*file: [repos/restricted/lua/swamp/shop/sh_modelbounds.lua (hidden)](https://github.com/swampservers/contrib/blob/master/repos/restricted/lua/swamp/shop/sh_modelbounds.lua)*


*Note: docs above are generated from luadoc-style code comments. README.md is autogenerated from readme_format.md*

**COPYRIGHT: This repository and most of its content is copyrighted and owned by Swamp Servers LLC. All other content is, to the best of our knowledge, used under license. If your copyrighted work is here without permission, please contact the email shown [here](https://swampservers.net/contact). This repository DOES NOT license its contents to be used for other purposes, nor does its existence on GitHub imply such a license.** This repository is almost entirely comprised of client/shared code and assets, which can already be extracted from GMod directly (eg. with gluasteal), so this repository does not grant new access to our content.

**CONTRIBUTOR LICENSE AGREEMENT: This repository is solely for game assets/code used by [Swamp Servers LLC](https://swamp.sv/) to operate our online games. By submitting your work to this repository (via commits/pull requests), you agree that we have a PERMANENT, IRREVOCABLE, WORLDWIDE, TRANSFERABLE LICENSE to use, modify, and distribute all of your submitted work as we see fit. By submitting work created by a third party, you attest that the creator of that work also agrees that we have a permanent, irrevocable, worldwide, transferable license to use, modify, and distribute their submitted work as we see fit. Do not submit work from a third party without their agreement to these terms. Note that work publicly available on sites like "Steam Workshop" may already be distributed under agreements conducive to this.**

