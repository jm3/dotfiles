-- lua/lsp.lua
-- Real, type-aware LSP completion/diagnostics — complements copilot.vim
-- (which is statistical/LLM ghost-text, not semantic) with servers that
-- actually read the TypeScript/Vue type system.
--
-- vtsls   -> TS/JS language features
-- vue_ls  -> Vue SFC template/script understanding (Volar), "hybrid mode":
--            vtsls does the heavy lifting inside <script>, with the Vue
--            plugin bolted on so it also understands .vue files.
-- Linting/fixing stays on ale (see plugins.lua) — this file is purely
-- completion/hover/go-to-def/diagnostics-from-the-compiler.

local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "vtsls", "vue_ls" },
  })

  local capabilities = require("blink.cmp").get_lsp_capabilities()

  local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

  vim.lsp.config("vtsls", {
    capabilities = capabilities,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "vue" },
              configNamespace = "typescript",
            },
          },
        },
      },
      -- keep auto-import suggestions scoped to your own code: exclude Node's
      -- built-in modules (node:fs, node:child_process, etc.) from both JS and
      -- TS auto-import completions -- noise for a Vue frontend, and they were
      -- swamping the suggestion list ahead of things you'd actually use.
      -- (matches against the declaration file's path, e.g. the @types/node
      -- package -- not the "node:" specifier text, which never matched.)
      typescript = {
        preferences = { autoImportFileExcludePatterns = { "**/node_modules/@types/node/**" } },
      },
      javascript = {
        preferences = { autoImportFileExcludePatterns = { "**/node_modules/@types/node/**" } },
      },
    },
  })

  vim.lsp.config("vue_ls", {
    capabilities = capabilities,
  })

  vim.lsp.enable({ "vtsls", "vue_ls" })

  -- Semantic tokens off: vtsls pushes these ~1-2s after a buffer opens (the
  -- "screen repaints" jm3 noticed), layered as extra @lsp.type.*/@lsp.mod.*/
  -- @lsp.typemod.* highlight groups on top of regular syntax highlighting.
  -- None of default/darkblue/catppuccin (checked all three) define real
  -- colors for those groups, so previously-distinct identifiers (e.g. an
  -- interface's property names) end up rendered with no color at all,
  -- collapsing toward whatever plain text looks like. Regular (non-semantic)
  -- syntax/treesitter highlighting is unaffected by this -- just turning off
  -- the extra undecorated layer.
  vim.lsp.semantic_tokens.enable(false)

  -- keymaps only in buffers that actually got an LSP attached
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local opts = { buffer = args.buf, noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    end,
  })
end

return M
