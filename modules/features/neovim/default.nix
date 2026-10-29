{inputs, ... }:{

  flake.nixosModules.neovim = { pkgs, ...}:{

    imports = [inputs.nvf.nixosModules.default ];

    programs.nvf = {
      enable = true;
      # Your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings = {
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp = {
          enable = true;
        };

      globals.mapleader = " ";

      keymaps = [
        (map "n" "<leader>cd" "<cmd>Ex<CR>" { })

        # Move selected lines up/down
        (map "v" "J" ":m '>+1<CR>gv=gv" { })
        (map "v" "K" ":m '<-2<CR>gv=gv" { })

        (map "n" "J" "mzJ`z" { })
        (map "n" "<C-d>" "<C-d>zz" { })
        (map "n" "<C-u>" "<C-u>zz" { })
        (map "n" "n" "nzzzv" { })
        (map "n" "N" "Nzzzv" { })

        # Paste/delete without clobbering the clipboard
        (map "x" "<leader>p" ''"_dP'' { })
        (map [ "n" "v" ] "<leader>d" ''"_d'' { })

        (map "i" "<C-c>" "<Esc>" { })

        # Quickfix / location list navigation
        (map "n" "<C-j>" "<cmd>cnext<CR>zz" { })
        (map "n" "<C-k>" "<cmd>cprev<CR>zz" { })
        (map "n" "<leader>k" "<cmd>lnext<CR>zz" { })
        (map "n" "<leader>j" "<cmd>lprev<CR>zz" { })

        (map "n" "Q" "<nop>" { })

        (map "n" "<leader>cc" "<cmd>!php-cs-fixer fix % --using-cache=no<CR>" { })

        # Replace word under cursor (on line)
        (map "n" "<leader>s" ''
          :s/\<<C-r><C-w>\>//gI<Left><Left><Left>'' { })

        (map "n" "<leader>x" "<cmd>!chmod +x %<CR>" { silent = true; })

        # OSC52 yank (needs remap, since these are <Plug> mappings)
        (map "n" "<leader>y" "<Plug>OSCYankOperator" { noremap = false; })
        (map "v" "<leader>y" "<Plug>OSCYankVisual" { noremap = false; })

        (map "n" "<leader>u" "<cmd>UndotreeToggle<CR>" { })

        # Quickfix list
        (map "n" "<leader>cl" ":cclose<CR>" { silent = true; })
        (map "n" "<leader>co" ":copen<CR>" { silent = true; })
        (map "n" "<leader>cn" ":cnext<CR>zz" { })
        (map "n" "<leader>cp" ":cprev<CR>zz" { })
        (map "n" "<leader>li" ":checkhealth vim.lsp<CR>" { desc = "LSP Info"; })

        (map "n" "<leader><leader>" "<cmd>so<CR>" { })
      ];

      # Plugins your keybinds depend on
      extraPlugins = {
        undotree.package = pkgs.vimPlugins.undotree;
        oscyank.package = pkgs.vimPlugins.vim-oscyank;
      };
      };
    };
  };
}