local path = vim.fn.stdpath("config") .. "/lua/gaming"

local handle, err = vim.uv.fs_scandir(path)

if not handle then
    print("Error opening directory: " .. err)
end

-- iterate over the files in the directory
while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then break end

    -- check if it's a file (not a directory)
    if type == "file" then
        -- remove the file extension for the require call
        local module = name:match("(.+)%..+$")

        if module and module ~= "init" then
            require("gaming." .. module)
        end
    end
end
