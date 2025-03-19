-- jm3 @ { monkey, sigma6, organic, zivity, 140proof, apple, etc } -- 🚀 ...

-- put cursor on any line below and press gF (buffer local shortcut)
-- to open one of the Lua config files below
require("lazy_bootstrap").setup()
require("lazy").setup(require("plugins"))

-- require("plugins") - -included only for easy access to plugin configs via gF :)
require("core")
require("code")
require("keys")
pcall(require, "personal") -- insert personal configs here (optional)
require("spacing")
require("spell_autocorrects")
require("super_powers")
require("visual")
require("config_utils")
