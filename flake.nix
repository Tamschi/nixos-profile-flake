{
  description = "NixOS overlay flake for common programs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    overlays = [];

    packages = {
      x86_64-linux.myPackages = with import nixpkgs { system = "x86_64-linux"; }; [
        vscode
        discord
        zulip
        syncthingtray
        florp
        keepassxc
      ];
    };
  };
}