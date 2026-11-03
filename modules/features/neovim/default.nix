{inputs, ... }:{

  flake.nixosModules.neovim = { pkgs, ...}:{

    imports = [inputs.nvf.nixosModules.default ];

    programs.nvf = {
      enable = true;
      # Your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings.vim = {
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
        };

      globals.mapleader = " ";

      vim.keymaps = [
        {
          key = "<leader>cd";
          mode = ["n"];
          action = "<cmd>Ex<CR>";
          desc = "File explorer";
        }

        # Move selected lines up/down
        {
          key = "J";
          mode = ["v"];
          action = ":m '>+1<CR>gv=gv";
        }
        {
          key = "K";
          mode = ["v"];
          action = ":m '<-2<CR>gv=gv";
        }

        {
          key = "J";
          mode = ["n"];
          action = "mzJ`z";
          desc = "Join lines, keep cursor";
        }
        {
          key = "<C-d>";
          mode = ["n"];
          action = "<C-d>zz";
        }
        {
          key = "<C-u>";
          mode = ["n"];
          action = "<C-u>zz";
        }
        {
          key = "n";
          mode = ["n"];
          action = "nzzzv";
        }
        {
          key = "N";
          mode = ["n"];
          action = "Nzzzv";
        }

        # Paste/delete without clobbering the clipboard
        {
          key = "<leader>p";
          mode = ["x"];
          action = ''"_dP'';
          desc = "Paste without overwriting register";
        }
        {
          key = "<leader>d";
          mode = ["n" "v"];
          action = ''"_d'';
          desc = "Delete without overwriting register";
        }

        {
          key = "<C-c>";
          mode = ["i"];
          action = "<Esc>";
        }

        # Quickfix / location list navigation
        {
          key = "<C-j>";
          mode = ["n"];
          action = "<cmd>cnext<CR>zz";
        }
        {
          key = "<C-k>";
          mode = ["n"];
          action = "<cmd>cprev<CR>zz";
        }
        {
          key = "<leader>k";
          mode = ["n"];
          action = "<cmd>lnext<CR>zz";
        }
        {
          key = "<leader>j";
          mode = ["n"];
          action = "<cmd>lprev<CR>zz";
        }

        {
          key = "Q";
          mode = ["n"];
          action = "<nop>";
        }

        {
          key = "<leader>dg";
          mode = ["n"];
          action = "<cmd>Neogen<CR>";
          desc = "Generate doc comment";
        }
        {
          key = "<leader>cc";
          mode = ["n"];
          action = "<cmd>!php-cs-fixer fix % --using-cache=no<CR>";
          desc = "Format PHP file";
        }

        # Replace word under cursor (on line)
        {
          key = "<leader>s";
          mode = ["n"];
          action = '':s/\<<C-r><C-w>\>//gI<Left><Left><Left>'';
          desc = "Replace word under cursor";
        }

        {
          key = "<leader>x";
          mode = ["n"];
          action = "<cmd>!chmod +x %<CR>";
          silent = true;
          desc = "Make file executable";
        }

        {
          key = "<leader>u";
          mode = ["n"];
          action = "<cmd>UndotreeToggle<CR>";
          desc = "Toggle undotree";
        }

        # Quickfix list
        {
          key = "<leader>cl";
          mode = ["n"];
          action = ":cclose<CR>";
          silent = true;
        }
        {
          key = "<leader>co";
          mode = ["n"];
          action = ":copen<CR>";
          silent = true;
        }
        {
          key = "<leader>cn";
          mode = ["n"];
          action = ":cnext<CR>zz";
        }
        {
          key = "<leader>cp";
          mode = ["n"];
          action = ":cprev<CR>zz";
        }
        {
          key = "<leader>li";
          mode = ["n"];
          action = ":checkhealth vim.lsp<CR>";
          desc = "LSP Info";
        }

        {
          key = "<leader><leader>";
          mode = ["n"];
          action = "<cmd>so<CR>";
          desc = "Source file";
        }
      ];
      # Plugins your keybinds depend on
      extraPlugins = {
        undotree.package = pkgs.vimPlugins.undotree;
        oscyank.package = pkgs.vimPlugins.vim-oscyank;
        neogen = {
          package = pkgs.vimPlugins.neogen;
          setup = "require('neogen').setup {}";
        };
      };
    };
  };
};
}