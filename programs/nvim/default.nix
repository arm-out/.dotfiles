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
          lsp = with pkgs; [
          ];
        };

        startupPlugins = {
          core = with pkgs.vimPlugins; [
            lze
            lzextras
	    (mkNvimPlugin inputs."material.nvim" "material")
          ];
        };

	optionalPlugins = {
	
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
            lsp = true;
          };
          # anything else to pass and grab in lua with `nixCats.extra`
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
