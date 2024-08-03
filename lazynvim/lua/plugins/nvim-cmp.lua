local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = {
        border = border("CmpBorder"),
      },
      documentation = {
        border = border("CmpBorder"),
        winhighlight = "Normal:CmpDoc",
      },
    },
    mapping = require("cmp").mapping.preset.insert({
      ["<S-Tab>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
      ["<Tab>"] = require("cmp").mapping.select_next_item(), -- next suggestion
    }),
  },
}
