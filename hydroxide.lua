local owner = "24rr"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua%22):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")