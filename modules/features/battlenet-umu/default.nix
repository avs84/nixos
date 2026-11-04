{inputs, ...}:{

  flake.nixosModules.battlenet-umu = {pkgs, ...}:
  {
    perSystem = {pkgs, ...}: {
    packages.wow-launcher = pkgs.writeShellApplication {
      name = "wow-launcher";

      runtimeInputs = with pkgs; [
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-tkg
        # (wineWow64Packages.full.override {
        #   wineRelease = "staging";
        #   mingwSupport = true;
        # })
        winetricks
        vulkan-loader
        dxvk
      ];

      # todo: fix
      text = ''
        export WINEPREFIX="$HOME/Games/Wow"
        export WINEARCH=win64
        export WINEDEBUG="-all"
        export DRI_PRIME=1
        export DXVK_HUD=1
        export DXVK_DEVICE_SELECT=1

        BNET_EXE="$WINEPREFIX/drive_c/Program Files (x86)/Battle.net/Battle.net.exe"
        WOW_EXE="$WINEPREFIX/drive_c/Program Files (x86)/World of Warcraft/_retail_/Wow.exe"
        INSTALLER="Battle.net-Setup.exe"

        if [ ! -d "$WINEPREFIX" ]; then
          echo "Initializing new Wine prefix..."
          mkdir -p "$WINEPREFIX"
          wineboot -u
        fi

        if [ -f "$WOW_EXE" ]; then
          echo "Launching WoW via DXVK..."
          wine "$WOW_EXE"
          exit 0
        fi

        if [ ! -f "$BNET_EXE" ]; then
          if [ -f "$INSTALLER" ]; then
            wine "$INSTALLER"
          else
            echo "Installer not found. Please download Battle.net-Setup.exe"
            exit 1
          fi
        else
          wine "$BNET_EXE"
        fi
      '';
    };
  };
};
}