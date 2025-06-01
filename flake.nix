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
          zulip
          syncthingtray
          floorp
          keepassxc
          syncthing
        ];
      };
    };
  };
}