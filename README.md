# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Notebooks (`.ipynb`)

Jupyter notebooks open as rendered markdown, not raw JSON:

- `jupytext.nvim` converts the notebook on read and syncs edits back on `:w`.
- `render-markdown.nvim` renders headings, tables, fenced code, and math in-buffer.
- `markdown-preview.nvim` opens a browser preview.

Install the one external dependency (plugins and Treesitter parsers are installed by lazy.nvim on first launch):

```sh
pipx install jupytext
```

| Action | How |
| --- | --- |
| Open a notebook | `nvim notebook.ipynb` |
| Toggle rendered/raw | `<leader>um` |
| Browser preview | `<leader>cp` |
| Save back to `.ipynb` | `:w` |

Existing outputs and notebook metadata survive the round trip; outputs are not displayed in the buffer. `~/.local/bin` is prepended to Neovim's `PATH` at startup so GUI/tmux launches find pipx binaries.

Health: `:checkhealth jupytext` and `:checkhealth render-markdown`.

i love GOONING
