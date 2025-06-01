{
  description = "NixOS overlay flake for common programs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    overlays = [
      (final: prev: {
        myPackages = with final; [
          vscode
          discord
          zulip
          syncthingtray
          florp
          keepassxc
        ];
      })
    ];

    packages = {
      myPackages = import nixpkgs {
        system = "x86_64-linux";
        overlays = self.overlays;
      }.myPackages;
    };
  };
}