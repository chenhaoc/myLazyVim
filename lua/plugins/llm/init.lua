local github_models = require("plugins.llm.models").GithubModels
local glm = require("plugins.llm.models").GLM
local ollama = require("plugins.llm.models").Ollama
local ui = require("plugins.llm.ui")
local keymaps = require("plugins.llm.keymaps")

return {
  {
    "Kurama622/llm.nvim",
    -- dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    dependencies = { "nvim-lua/plenary.nvim", "Kurama622/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
      local apps = require("plugins.llm.app")
      local opts = {
        prompt = "You are a helpful Chinese assistant.",
        temperature = 0.3,
        top_p = 0.7,
        -- enable_trace = true,

        spinner = {
          text = { "󰧞󰧞", "󰧞󰧞", "󰧞󰧞", "󰧞󰧞" },
          hl = "Title",
        },

        prefix = {
          user = { text = "  ", hl = "Title" },
          assistant = { text = "  ", hl = "Added" },
        },

        display = {
          diff = {
            layout = "vertical", -- vertical|horizontal split for default provider
            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
            provider = "mini_diff", -- default|mini_diff
          },
        },
        --[[ custom request args ]]
        -- args = [[return {url, "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
        -- history_path = "/tmp/llm-history",
        save_session = true,
        max_history = 15,
        max_history_name_length = 20,
      }
      --for _, conf in pairs({ ui, github_models, apps, keymaps }) do
      for _, conf in pairs({ ui, ollama, apps, keymaps }) do
        opts = vim.tbl_deep_extend("force", opts, conf)
      end
      require("llm").setup(opts)
    end,
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "LLM SessionToggle" },
      { "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>", desc = "LLM WordTranslate" },
      { "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>", desc = "LLM CodeExplain" },
      { "<leader>at", mode = "n", "<cmd>LLMAppHandler Translate<cr>", desc = "LLM Translate" },
      { "<leader>tc", mode = "x", "<cmd>LLMAppHandler TestCode<cr>", desc = "LLM TestCode" },
      --{ "<leader>au", mode = "n", "<cmd>LLMAppHandler UserInfo<cr>" },
      { "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>", desc = "LLM CommitMsg" },
      { "<leader>ad", mode = "v", "<cmd>LLMAppHandler DocString<cr>", desc = "LLM DocString" },
      { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = "LLM OptimCompare" },
      --{ "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>" },
      -- { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
      -- { "<leader>ts", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
    },
  },
}

--return {
--{
--"Kurama622/llm.nvim",
--dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
----cmd = { "LLMSessionToggle", "LLMSelectedTextHandler" },
--cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
--config = function()
--require("llm").setup({
--prompt = "You are a helpful chinese assistant.",

--prefix = {
--user = { text = "😃 ", hl = "Title" },
--assistant = { text = "⚡ ", hl = "Added" },
--},

--style = "float", -- right | left | above | below | float

---- [[ Github Models ]]
----url = "https://models.inference.ai.azure.com/chat/completions",
----model = "gpt-4o",
----api_type = "openai",
--[> Optional: If you need to use models from different platforms simultaneously,
--you can configure the `fetch_key` to ensure that different models use different API Keys.]]
----fetch_key = function()
----return switch("enable_gpt")
----end,

---- [[ cloudflare ]]
---- model = "@cf/google/gemma-7b-it-lora",

---- [[ ChatGLM ]]
---- url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
---- model = "glm-4-flash",

---- [[ kimi ]]
---- url = "https://api.moonshot.cn/v1/chat/completions",
---- model = "moonshot-v1-8k", -- "moonshot-v1-8k", "moonshot-v1-32k", "moonshot-v1-128k"
---- api_type = "openai",

--[> ollama <]
--url = "http://localhost:11434/api/chat",
--model = "qwen2.5-coder:3b",
--api_type = "ollama",

---- [[ siliconflow ]]
---- url = "https://api.siliconflow.cn/v1/chat/completions",
---- api_type = "openai",
---- model = "Qwen/Qwen2.5-7B-Instruct",
---- -- [optional: fetch_key]
---- fetch_key = function()
----   return switch("enable_siliconflow")
---- end,

---- [[ openrouter ]]
---- url = "https://openrouter.ai/api/v1/chat/completions",
---- model = "google/gemini-2.0-flash-exp:free",
---- api_type = "openai",
---- fetch_key = function()
----   return switch("enable_openrouter")
---- end,

---- [[deepseek]]
---- url = "https://api.deepseek.com/chat/completions",
---- model = "deepseek-chat",
---- api_type = "openai",
---- fetch_key = function()
----   return switch("enable_deepseek")
---- end,

--max_tokens = 1024,
--save_session = true,
--max_history = 15,
--history_path = "/tmp/history",    -- where to save history
--temperature = 0.3,
--top_p = 0.7,

--spinner = {
--text = {
--"󰧞󰧞",
--"󰧞󰧞",
--"󰧞󰧞",
--"󰧞󰧞",
--},
--hl = "Title",
--},

--display = {
--diff = {
--layout = "vertical", -- vertical|horizontal split for default provider
--opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
--provider = "mini_diff", -- default|mini_diff
--},
--},

---- stylua: ignore
--keys = {
---- The keyboard mapping for the input window.
--["Input:Cancel"]      = { mode = "n", key = "<C-c>" },
--["Input:Submit"]      = { mode = "n", key = "<cr>" },
--["Input:Resend"]      = { mode = "n", key = "<C-r>" },

---- only works when "save_session = true"
--["Input:HistoryNext"] = { mode = "n", key = "<C-j>" },
--["Input:HistoryPrev"] = { mode = "n", key = "<C-k>" },

---- The keyboard mapping for the output window in "split" style.
--["Output:Ask"]        = { mode = "n", key = "i" },
--["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
--["Output:Resend"]     = { mode = "n", key = "<C-r>" },

---- The keyboard mapping for the output and input windows in "float" style.
--["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
--["Session:Close"]     = { mode = "n", key = "<esc>" },
--},
--})
--end,
--keys = {
--{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
--{ "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
--{ "<leader>t", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
--{ "<leader>ai", mode = "v", "<cmd>LLMSelectedTextHandler " },
--{ "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>" },
--},
--},
--}
