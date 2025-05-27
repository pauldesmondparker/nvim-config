local Plugin = { 'ggandor/leap.nvim' }

function Plugin.config()
  require('leap').set_default_mappings()
end

return Plugin
