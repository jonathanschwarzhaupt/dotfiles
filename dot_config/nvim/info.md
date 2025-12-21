# LazyVim Configuration Guide

## Directory Structure

LazyVim uses a very organized folder structure:

```
~/.config/nvim/
├── init.lua                    # Entry point - just requires config.lazy
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Lazy.nvim bootstrap & setup
│   │   ├── options.lua        # Vim options (your settings)
│   │   ├── keymaps.lua        # Custom keymaps (optional)
│   │   └── autocmds.lua       # Autocommands (optional)
│   └── plugins/
│       ├── *.lua              # Each file = plugin config or group
│       └── extras.lua         # Import LazyVim extras
```

## How It Works

1. **`init.lua`** → Calls `config.lazy`
2. **`config/lazy.lua`** → Bootstraps lazy.nvim and tells it to load:
   - LazyVim's core plugins
   - Your custom plugins from `lua/plugins/`
3. **`plugins/*.lua`** → Each file returns a table of plugin specs
4. **`config/options.lua`** → Your vim options (loaded automatically)

## Plugin Configuration Anatomy

Each file in `lua/plugins/` can contain one or more plugin specs:

```lua
return {
  {
    "author/plugin-name",        -- Plugin repository
    enabled = false,              -- Disable plugin entirely
    opts = { ... },               -- Plugin options (merged with defaults)
    config = function() ... end,  -- Custom setup function
    keys = { ... },               -- Lazy-load on these keybindings
    cmd = "Command",              -- Lazy-load on this command
    event = "Event",              -- Lazy-load on this event
  },
}
```

### Key Concepts

- **`opts = { }`** → Passes options to the plugin's `.setup()` function
- **`enabled = false`** → Completely disables a plugin
- **Overriding LazyVim defaults** → Just specify the same plugin with your changes

## Common Patterns

### Disabling a Plugin

```lua
return {
  { "author/plugin-name", enabled = false },
}
```

### Configuring Plugin Options

```lua
return {
  {
    "author/plugin-name",
    opts = {
      option1 = true,
      option2 = "value",
    },
  },
}
```

### Adding Custom Keybindings

```lua
return {
  {
    "author/plugin-name",
    keys = {
      { "<leader>xx", "<cmd>SomeCommand<cr>", desc = "Description" },
    },
  },
}
```

### Importing LazyVim Extras

LazyVim provides preconfigured "extras" for languages and features:

```lua
return {
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
```

## Important LazyVim v12+ Changes

### snacks.nvim Consolidation

LazyVim v12+ replaced several plugins with `snacks.nvim`:
- `mini.pairs` → `snacks.nvim` (indent module)
- `noice.nvim` → `snacks.nvim` (notifier/dashboard modules)
- `nvim-notify` → `snacks.nvim` (notifier module)

To disable specific snacks features:

```lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = true },
    },
  },
}
```

## File Locations

### Configuration Files

- **`lua/config/options.lua`** - Set vim options here
- **`lua/config/keymaps.lua`** - Custom keybindings
- **`lua/config/autocmds.lua`** - Autocommands

### Plugin Files

- **`lua/plugins/*.lua`** - Each file defines plugins
- Files are automatically loaded
- You can organize by feature, language, or however you prefer

## Useful Commands

- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing & update plugins
- `:Mason` - Open LSP/DAP/linter installer
- `:checkhealth lazy` - Verify plugin health
- `:LazyExtras` - Browse and install LazyVim extras

## Tips

1. **Keep it simple** - Don't over-configure initially
2. **Use extras** - LazyVim extras provide pre-configured setups for languages
3. **Read the docs** - Check LazyVim's documentation at https://lazyvim.org
4. **Check examples** - Look at `lua/plugins/example.lua` for reference
5. **Version management** - Generally avoid pinning plugin versions unless you have issues
