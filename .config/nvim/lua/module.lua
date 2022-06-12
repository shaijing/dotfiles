module = {}
module.name="This is module"
module.plugins={}

function module.loadPlugin()
    if packer_plugins["nvim-tree"] and packer_plugins["nvim-tree"].loaded then
        print("nvim-treeis loaded")
    end

end

return module