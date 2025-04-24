{ config, lib, inputs, ... }: let
  utils = inputs.nixCats.utils;

in {

  imports = [
    inputs.nixCats.homeModule
  ];

  config = {
    nixCats = {
      enable = true;
      addOverlays =  [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = [ "nvim" ];

      luaPath = "${./.}";

      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = {
		  core = with pkgs; [
			ripgrep
		  ];

          lsp = with pkgs; [
			lua-language-server
          ];

		  lint = with pkgs; [
		  ];

		  format = with pkgs; [
		  ];
        };

        startupPlugins = {
          core = with pkgs.vimPlugins; [
            lze
            lzextras
			plenary-nvim
          ];

		  theme = with pkgs.vimPlugins; [
	  	    (mkNvimPlugin inputs."material.nvim" "material")
		  ];
        };

		optionalPlugins = {
		  core = with pkgs.vimPlugins; [
			neo-tree-nvim
			nui-nvim
			which-key-nvim
			alpha-nvim
			auto-session
			bufferline-nvim
			snacks-nvim
			nvim-treesitter.withAllGrammars
			nvim-ts-autotag
			nvim-autopairs
			nvim-ts-context-commentstring
			comment-nvim
			nvim-lspconfig
			lazydev-nvim
		  ];

		  telescope = with pkgs.vimPlugins; [
			telescope-nvim
			telescope-ui-select-nvim
			telescope-fzf-native-nvim
		  ];

		  cmp = with pkgs.vimPlugins; [
			blink-cmp
			luasnip
			friendly-snippets
			colorful-menu-nvim
		  ];

		  theme = with pkgs.vimPlugins; [
			lualine-nvim
			nvim-web-devicons
		  ];
		};

      });

      packageDefinitions.replace = {
        nvim = {pkgs , ... }: {
          settings = {
            wrapRc = true;
            aliases = [ "vim" ];
          };
          categories = {
		    core = true;
			telescope = true;
			cmp = true;
			theme = true;
            lsp = true;
			lint = true;
			format = true;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
