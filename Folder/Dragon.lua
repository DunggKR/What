local files = {
    html = "https://dunggkr.github.io/What/index.html",
    css  = "https://dunggkr.github.io/What/style.css",
    js   = "https://dunggkr.github.io/What/script.js"
}

local fetched = {}

for k, url in pairs(files) do
    local res = gg.makeRequest(url)
    if res and res.content then
        fetched[k] = res.content
    else
        gg.alert("❌ Failed to load " .. k .. " from " .. url)
    end
end

-- Debug output: show size of each fetched file
gg.toast("Fetched HTML: " .. #fetched.html .. " bytes")
gg.toast("Fetched CSS: " .. #fetched.css .. " bytes")
gg.toast("Fetched JS: " .. #fetched.js .. " bytes")

-- Optional: save to local files (only works outside of Game Guardian unless file access is allowed)
-- local file = io.open("/sdcard/index.html", "w") file:write(fetched.html) file:close()
