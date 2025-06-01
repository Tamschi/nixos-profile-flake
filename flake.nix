{
  description = "NixOS profile flake for common programs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      my-profile = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            environment.systemPackages = with pkgs; [
              vscode
              discord
              zulip
              syncthingtray
              florp
              keepassxc
            ];

            services.syncthing.enable = true;
            services.syncthing.tray = true;
          }
        ];
      };
    };
  };
}