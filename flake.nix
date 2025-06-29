{
  description = "NixOS overlay flake for common programs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    overlays = [];

    packages = {
      x86_64-linux.myPackages = let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      in pkgs.buildEnv {
        name = "my-packages";
        paths = with pkgs; [
          vscode
          discord
          direnv
          zulip
          syncthingtray
          floorp
          keepassxc
          syncthing
          rustup
          htop
          btop
          neofetch
          ripgrep
          bat
          fd
          starship
          zoxide
          kitty
          obsidian
          gimp
          inkscape
          vlc
          qbittorrent
          element-desktop
          flameshot
          clang
          clang-tools
          lldb
          lld
          cmake
          gdb
          gcc
          mold
          android-studio
          android-tools
          jdk17
          gradle
        ];
        pathsToLink = [ "/bin" "/share" ];
        ignoreCollisions = true;
      };
    };
  };
}